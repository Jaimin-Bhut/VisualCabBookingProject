using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Windows.Forms;


public partial class AdminSignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblSignIn where email =@username and pass=@password", con);
        cmd.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = txtPass.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["email"] = txtEmail.Text;
            Response.Redirect("AdminMain.aspx");

        }
        else
        {
           MessageBox.Show("Wrong Password");
        }
        con.Close();
    }
}