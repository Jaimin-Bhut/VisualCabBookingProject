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


public partial class UserSignIn : System.Web.UI.Page
{
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    this.MasterPageFile = "~/MasterPage1.master";
    //}
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from tblUserSignUp where Email =@username and Password=@password", con);
            cmd.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = txtPass.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                MessageBox.Show("Login Succesfully");
                Session["email"] = txtEmail.Text;
                Response.Redirect("BookCabPage.aspx");

            }
            else
            {
                MessageBox.Show("Wrong Password");
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}