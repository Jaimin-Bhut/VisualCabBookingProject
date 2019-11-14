using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class AddCity : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }

   void disp()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Select State,c.Id,City from tblState s, tblCity c where s.Id = c.State_id", con);
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            DataTable Dt1 = new DataTable();
            Adp.Fill(Dt1);
            gvData.DataSource = Dt1;
            gvData.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select * from tblState ", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            ddlState.DataSource = dt;
            ddlState.DataBind();
            ddlState.DataTextField = "State";
            ddlState.DataValueField = "Id";
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("--Select State--", "-1"));
            con.Close();
            disp();
        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand("Select State,s.Id,City from tblState s,tblCity c where s.Id=c.State_id and c.State_id ='" + ddlState.SelectedValue.ToString() + "'", con);
        //SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //Adpt.Fill(dt);
        //gvData.DataSource = dt;
        //gvData.DataBind();
        //con.Close();
    }
    protected void btnAddCity_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from tblCity where State_id ='" + ddlState.SelectedValue.ToString() + "' and City ='" + txtCity.Text + "'", con);
            int c1 = Int32.Parse(cmd.ExecuteScalar().ToString());
            if (c1 == 1)
            {
                lblMessage.Text = "City is Already Exist";
                txtCity.Text = String.Empty;
                ddlState.SelectedIndex = 0;

            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("insert into tblCity values(@state,@city)", con);
                cmd1.Parameters.AddWithValue("@state", SqlDbType.Int).Value = ddlState.SelectedValue;
                cmd1.Parameters.AddWithValue("@city", SqlDbType.VarChar).Value = txtCity.Text.Trim().ToUpper();
                cmd1.ExecuteNonQuery();
                lblMessage.Text = "Data Inserted Succesfully";
                txtCity.Text = String.Empty;
                ddlState.SelectedIndex = 0;
                con.Close();
            }
        }
        catch (Exception ee)
        {
            Response.Write(ee);
        }
        disp();
    }
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvData.EditIndex = -1;
        disp();
    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int DelId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from tblCity Where Id=" + DelId+"", con);
        cmd.ExecuteNonQuery();
        Response.Write(cmd.CommandText);
        con.Close();
        disp();
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = gvData.Rows[e.RowIndex].FindControl("lid") as Label;
        int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        DropDownList ddla = gvData.Rows[e.RowIndex].FindControl("eddlState") as DropDownList;
        TextBox txtname = gvData.Rows[e.RowIndex].FindControl("txtGCity") as TextBox;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tblCity set State_id=" + ddla.SelectedValue + ",City='" + txtname.Text.Trim().ToUpper() + "' where Id=" + UpdateId, con);
        Response.Write(cmd.CommandText);
        cmd.ExecuteNonQuery();
        con.Close();
        gvData.EditIndex = -1;
        disp();
    }
    protected void ddlState_DataBound(object sender, EventArgs e)
    {
    }
    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (Page.IsPostBack)
        {
            try
            {
                DropDownList DropDownList1 = (e.Row.FindControl("eddlState") as DropDownList);
                SqlCommand cmd = new SqlCommand("select * from tblState", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt1 = new DataTable();
                da.Fill(dt1);
                DropDownList1.DataSource = dt1;
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataTextField = "State";
                DropDownList1.DataBind();
               
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}
