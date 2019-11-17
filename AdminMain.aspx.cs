using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


public partial class AdminMain : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Session["email"] == null)
        {
            Response.Redirect("AdminSignIn.aspx?is=loginmust");
        }
    }
    protected void imgbtnAddArea_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddArea.aspx");
    }
    protected void imgbtnAddDriver_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddDriver.aspx");
    }
    protected void imgAddCity_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddCity.aspx");
    }
    protected void imgAddState_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddState.aspx");
    }
    protected void imgAddCab_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddCab.aspx");
    }
   
    protected void imgbtnAddCharges_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddCharges.aspx");
    }
    protected void imgbtnSignOut_Click(object sender, ImageClickEventArgs e)
    {
        DialogResult result = MessageBox.Show("Are You Sure You Want to Sign-Out", "Yes or No", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);      
            if (result == DialogResult.Yes)
            {
                    Session.Clear();
                    Response.Redirect("SignInMain.aspx");
            }
    }
    protected void imgbtnFeedback_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ViewFeedback.aspx");
    }
}