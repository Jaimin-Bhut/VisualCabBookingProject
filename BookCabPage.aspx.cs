using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class BookCabPage : System.Web.UI.Page
{
//    protected void Page_PreInit(object sender, EventArgs e)
//    {
//        this.MasterPageFile = "~/MasterPage1.master";
//    }
    void cab()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        string com = "Select * from tblCab where Working_City ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlCabType.DataSource = dt;
        ddlCabType.DataBind();
        ddlCabType.DataTextField = "Cab_name";
        ddlCabType.DataValueField = "Cab_Id";
        ddlCabType.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            string com = "Select * from tblCity";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataBind();
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
            lblSCity.Text = ddlCity.SelectedItem.ToString();
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlPickUp.DataSource = dt;
        ddlPickUp.DataBind();
        ddlPickUp.DataTextField = "Area";
        ddlPickUp.DataValueField = "Id";
        ddlPickUp.DataBind();
        lblSpickup.Text = ddlPickUp.SelectedItem.ToString();
        cab();
    }
    protected void ddlCabType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlPickUp_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlDrop.DataSource = dt;
        ddlDrop.DataBind();
        ddlDrop.DataTextField = "Area";
        ddlDrop.DataValueField = "Id";
        ddlDrop.DataBind();
    }
}