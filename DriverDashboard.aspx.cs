using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class DriverDashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
    string driverEmail;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Page.Session["DriverEmail"] == null)
            {
                Response.Redirect("DriverSignIn.aspx?is=loginmust");
            }
            else
            {
                disp();
            }
        }
        
    }
    void disp()
    {
        driverEmail = Session["DriverEmail"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select b.*,d.Driver_Email from tblBooking b,tblDriver d where d.Driver_Email='"+driverEmail+"' and b.Cab=d.Cab_Id", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvData.DataSource = dt;
        gvData.DataBind();
        con.Close();
    }
    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvData.EditIndex = -1;
        disp();

    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = gvData.Rows[e.RowIndex].FindControl("gvlblBookingid") as Label;
        int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        DropDownList ddlStatus = gvData.Rows[e.RowIndex].FindControl("gvddlStatus") as DropDownList;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tblBooking set Status='"+ddlStatus.SelectedValue.ToString().ToUpper()+"' where Booking_id='"+UpdateId+"'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        gvData.EditIndex = -1;
        disp();

    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        if (Session["DriverEmail"] != "")
        {
            Session.Clear();
            Response.Redirect("SignInMain.aspx");
        }
    }
}