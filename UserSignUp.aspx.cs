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

public partial class UserSignUp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    this.MasterPageFile = "~/MasterPage1.master";
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select * from tblCity ", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "-1"));

        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tblUserSignUp where Email ='" + txtEmail.Text + "'", con);
        int c1 = Int32.Parse(cmd.ExecuteScalar().ToString());
        if (c1 == 1)
        {
            lblMessage.Text = "Email is Already Exist";
        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("insert into tblUserSignUp values(@name,@add,@city,@contact,@email,@pass)", con);
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtName.Text.Trim().ToUpper();
            cmd.Parameters.Add("@add", SqlDbType.NVarChar).Value = txtAddress.Text.Trim().ToUpper();
            cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue;
            cmd.Parameters.Add("@contact", SqlDbType.NVarChar).Value = txtContactNo.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@pass", SqlDbType.NVarChar).Value = txtCPassword.Text;
            cmd.ExecuteNonQuery();
            Response.Redirect("UserSignIn.aspx");
        }
        con.Close();
    }
}
