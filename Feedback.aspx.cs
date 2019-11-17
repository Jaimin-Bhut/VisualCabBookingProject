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

public partial class Feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Session["UserEmail"] == null)
        {
            Response.Redirect("UserSignIn.aspx?is=loginmust");

        }
        else
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "select * from tblUserSignUp where Email='" + Page.Session["UserEmail"].ToString() + "'";
            SqlDataReader dr;
            dr = com.ExecuteReader();

            if (dr.Read())
            {
                txtUserName.Text = dr["Name"].ToString();
                txtUserEmail.Text = dr["Email"].ToString();
            }
            con.Close();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblFeedback values (@f_email,@f_name,@f_date,@f_feedback)", con);
        cmd.Parameters.AddWithValue("f_name", txtUserName.Text);
        cmd.Parameters.AddWithValue("f_email", txtUserEmail.Text);
        cmd.Parameters.AddWithValue("f_date", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("f_feedback", txtUserFeedback.Text);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != "")
        {
            Session.Clear();
            Response.Redirect("SignInMain.aspx");
        }
        else
        {
            MessageBox.Show("Opps!You Not Sign In");
        }
    }
}

