using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignInMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgbtnAdmin_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AdminSignIn.aspx");

    }
    protected void imgbtnDriver_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect(".aspx");

    }
    protected void imgbtnUser_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UserSignIn.aspx");

    }
}