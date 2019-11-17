using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;


public partial class AddCab : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Page.Session["email"] == null)
            {
                Response.Redirect("AdminSignIn.aspx?is=loginmust");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select * from tblCity ", con);
                SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                ddlCity.DataSource = dt;
                ddlCity.DataBind();
                ddlCity.DataTextField = "City";
                ddlCity.DataValueField = "Id";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                disp();
                //txtCabName.Text = "";
                //txtCabNo.Text = "";
                //txtLuggCapacity.Text = "";
                //txtPerCapacity.Text = "";
            }
        }

    }
    void emptyControl()
    {
        txtCabName.Text = "";
        txtCabNo.Text = "";
        txtLuggCapacity.Text = "";
        txtPerCapacity.Text = "";
        ddlCabType.Items.Clear();
        ddlCity.Items.Clear();
    }
    void city()
    {
        SqlCommand cmd = new SqlCommand("select * from tblCity", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "Id";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
    }
    void disp()
    {
        try
        {
            DropDownList gvddlWorkingCity = (FindControl("gvddlWorkingCity") as DropDownList);
            SqlCommand cmd = new SqlCommand("Select c.*,City from tblCab c,tblCity ci where c.Working_City=ci.Id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            gvData.DataSource = dt1;
            gvData.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnAddCab_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblCab values('" + txtCabNo.Text.Trim().ToUpper() + "','" + txtCabName.Text.Trim().ToUpper() + "','" + ddlCabType.SelectedValue.Trim().ToUpper() + "','" + txtPerCapacity.Text.Trim() + "','" + txtLuggCapacity.Text.Trim() + "','" + ddlCity.SelectedValue + "','Available')", con);
            cmd.ExecuteNonQuery();
            Response.Write(cmd.CommandText);
            con.Close();
            emptyControl();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
       /* cmd.Parameters.AddWithValue("Cab_Id",SqlDbType.Int).Value=txtCabNo.Text;
        cmd.Parameters.AddWithValue("Cab_name", txtCabName.Text);
        cmd.Parameters.AddWithValue("Cab_type", ddlCabType.SelectedValue);
        cmd.Parameters.AddWithValue("Person_capacity", txtPerCapacity.Text);
        cmd.Parameters.AddWithValue("Lougage_capacity", txtLuggCapacity.Text);
        cmd.Parameters.AddWithValue("Price_per_Km", txtPricePerKm.Text);
        cmd.Parameters.AddWithValue("Working_City", ddlCity.SelectedValue); 
    */
    }

    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            
            DropDownList gvddlCity = (e.Row.FindControl("gvddlWorkingCity") as DropDownList);
            SqlCommand cmd = new SqlCommand("select * from tblCity", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //    gvddlCity.DataSource = dt;
            //gvddlCity.DataValueField = "Id";
            //gvddlCity.DataTextField = "City";
            //gvddlCity.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvData.EditIndex = -1;
        disp();
    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int DelId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblCab Where Cab_Id=" + DelId, con);
            cmd.ExecuteNonQuery();
            con.Close();
            disp();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string UpdateId = gvData.DataKeys[e.RowIndex].Value.ToString();
            DropDownList City = gvData.Rows[e.RowIndex].FindControl("gvddlWorkingCity") as DropDownList;
            DropDownList Cab_type = gvData.Rows[e.RowIndex].FindControl("gvddlCabType") as DropDownList;
            DropDownList Status = gvData.Rows[e.RowIndex].FindControl("gvddlStatus") as DropDownList;
            System.Web.UI.WebControls.TextBox Cab_Id = gvData.Rows[e.RowIndex].FindControl("gvtxtCabId") as System.Web.UI.WebControls.TextBox;
            System.Web.UI.WebControls.TextBox Cab_name = gvData.Rows[e.RowIndex].FindControl("gvtxtCabName") as System.Web.UI.WebControls.TextBox;
            System.Web.UI.WebControls.TextBox PersonCapacity = gvData.Rows[e.RowIndex].FindControl("gvtxtPersonCapacity") as System.Web.UI.WebControls.TextBox;
            System.Web.UI.WebControls.TextBox LougageCapacity = gvData.Rows[e.RowIndex].FindControl("gvtxtLougageCapacity") as System.Web.UI.WebControls.TextBox;
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblCab set Cab_Id='" + Cab_Id.Text.Trim().ToUpper() +"',Cab_name='" + Cab_name.Text + "',Cab_type ='" + Cab_type.SelectedItem.ToString().ToUpper() + "',Person_capacity ='" + PersonCapacity.Text + "',Lougage_capacity='" + LougageCapacity.Text + "',Working_City='" +City.SelectedValue + "',Status='"+Status.SelectedItem.ToString()+"' where Cab_Id='" + UpdateId+"'", con);
            Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            disp();
            con.Close();
            gvData.EditIndex = -1;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}