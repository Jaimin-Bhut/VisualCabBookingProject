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

public partial class DriverSingIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblDriver where Driver_Email =@username and Driver_Password=@password", con);
        cmd.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = txtPass.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["DriverEmail"] = txtEmail.Text;
            Response.Redirect("DriverDashboard.aspx");

        }
        else
        {
            MessageBox.Show("Wrong Password");
        }
        con.Close();
    }
}