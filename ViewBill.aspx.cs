using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class ViewBill : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}