using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;


public partial class AddArea : System.Web.UI.Page
{
    protected void Page_PreInit(object sender,EventArgs e)
    {
        this.MasterPageFile="~/MasterPage1.master";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            string com = "Select * from tblState";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlState.DataSource = dt;
            ddlState.DataBind();
            ddlState.DataTextField = "State";
            ddlState.DataValueField = "Id";
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
            ddlState.Items[0].Selected = true;
            ddlState.Items[0].Attributes["disabled"] = "disabled";
            disp();
           

        }
    }
    void disp()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("Select State,s.Id,City,Area from tblState s , tblCity c,tblArea a where s.Id = c.State_id and a.City_id=c.Id", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt1 = new DataTable();
        da.Fill(dt1);
        gvData.DataSource = dt1;
        gvData.DataBind();
        con.Close();

    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from tblCity Where State_id ='" + ddlState.SelectedValue.ToString() + "'", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "Id";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
        ddlCity.Items[0].Selected = true;
        ddlCity.Items[0].Attributes["disabled"] = "disabled";
        disp();

    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
       /* SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from tblArea where City_id ='" + ddlCity.SelectedValue.ToString() + "'", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        gvData.DataSource = dt;
        ddlCity.DataBind();
        con.Close();*/
    }
    protected void btnAddArea_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tblArea where State_id ='" + ddlState.SelectedValue.ToString() + "' and City_id ='" + ddlCity.SelectedValue.ToString() + "' and Area = '"+txtArea.Text+"'", con);

        int c1 = Int32.Parse(cmd.ExecuteScalar().ToString());
        if (c1 == 1)
        {
            MessageBox.Show("City is Already Exist");

        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("insert into tblArea values('" + ddlState.SelectedValue + "','" + ddlCity.SelectedValue + "','" + txtArea.Text.Trim().ToUpper() + "')", con);
            cmd1.ExecuteNonQuery();
            MessageBox.Show("Data inserted Succesfully");
            disp();
            ddlState.SelectedIndex = 0;
            ddlCity.SelectedIndex = 0;
        }
        con.Close();
    }
    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {

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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblArea Where Id=" + DelId, con);
            Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            con.Close();
            disp();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
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
            int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            //string id = (gvData.Rows[e.RowIndex].FindControl("gvlblId") as System.Web.UI.WebControls.Label).Text;
            string state = (gvData.Rows[e.RowIndex].FindControl("eddlState") as DropDownList).SelectedValue;
            string city = (gvData.Rows[e.RowIndex].FindControl("eddlCity") as DropDownList).SelectedValue;
            string area = (gvData.Rows[e.RowIndex].FindControl("etxtArea") as System.Web.UI.WebControls.TextBox).Text.Trim().ToUpper();
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblArea set State_id=" + state + ",City_id=" + city + ",Area ='" + area + "' where Id='" + UpdateId + "'", con);
            Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            con.Close();
            gvData.EditIndex = -1;
            disp();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }

    }
    protected void eddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            DropDownList gvddlState = (FindControl("eddlState") as DropDownList);
            DropDownList gvddlCity = (FindControl("eddlCity") as DropDownList);
            SqlCommand cmd = new SqlCommand("select * from tblCity Where State_id ='" + gvddlState.SelectedValue + "'", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            gvddlCity.DataSource = dt;
            gvddlCity.DataTextField = "City";
            gvddlCity.DataValueField = "Id";
            gvddlCity.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}