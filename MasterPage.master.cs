using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        DialogResult result = MessageBox.Show("Are You Sure You Want to Sign-Out", "Yes or No", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);
        try
        {
            if (result == DialogResult.Yes)
            {
                if (Session["email"] != "")
                {
                    MessageBox.Show("Sign-Out Succesfully:-" + Session["email"].ToString());
                    Session.Clear();
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    MessageBox.Show("Opps!You Not Sign In");
                }
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }

    }
}


