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
    protected void imgbtnAssignCab_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnViewBill_Click(object sender, ImageClickEventArgs e)
    {

    }
}