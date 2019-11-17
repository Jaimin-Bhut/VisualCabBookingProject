using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

using System.Configuration;

public partial class AddLocatality : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }
    void disp()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblState", con);
        SqlDataAdapter Adp = new SqlDataAdapter(cmd);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        gvData.DataSource = Dt;
        gvData.DataBind();
        con.Close();
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
                disp();
            }
        }
    }
    protected void btnAddState_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from tblState where State ='" + txtState.Text + "'", con);
            int c1 = Int32.Parse(cmd.ExecuteScalar().ToString());
            if (c1 == 1)
            {
                lblMessage.Text="State is Already Exist";
                txtState.Text = String.Empty;

            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("insert into tblState values (@state)", con);
                cmd1.Parameters.AddWithValue("@state",SqlDbType.VarChar).Value=txtState.Text.Trim().ToUpper();
                cmd1.ExecuteNonQuery();
                lblMessage.Text = "Data Inserted Succesfully";
                txtState.Text = String.Empty;
            }
            con.Close();
        }
        catch(Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }
        disp();

    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblState Where Id=" + delId, con);
            cmd.ExecuteNonQuery();
            con.Close();
            disp();
        }
        catch (Exception ex)
        {
            lblMessage.Text="Delete is not postible";
        }

    } 
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvData.EditIndex = -1;
        disp();
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        string State = (gvData.Rows[e.RowIndex].FindControl("txtState") as System.Web.UI.WebControls.TextBox).Text.Trim().ToUpper();
        con.Open();
        SqlCommand cmd = new SqlCommand("update tblState set State='" + State + "'where Id='" + UpdateId + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        gvData.EditIndex = -1;
        disp();

    }
}