using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;

public partial class Driver_cab_Managment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            SqlCommand cmd = new SqlCommand("select * from tblDriver", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            ddlDriver.DataSource = dt;
            ddlDriver.DataBind();
            ddlDriver.DataTextField = "Driver_Name";
            ddlDriver.DataValueField = "Id";
            ddlDriver.DataBind();
            city();
        }
    }
    void city()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from tblCab",con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCab.DataSource = dt;
        ddlCab.DataBind();
        ddlCab.DataTextField = "Cab_Name";
        ddlCab.DataValueField = "Cab_Id";
        ddlCab.DataBind();
    }
    protected void ddlDriver_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblDriver_cab_Managment values(@Driver,@Cab,@City,@from,@to)", con);
        cmd.Parameters.Add("@Driver", SqlDbType.Int).Value = ddlDriver.SelectedValue;
        cmd.Parameters.Add("@Cab", SqlDbType.NVarChar).Value = ddlCab.SelectedValue;
        cmd.Parameters.Add("@City", SqlDbType.Int).Value = ddlCity.SelectedValue;
        cmd.Parameters.Add("@from", SqlDbType.Date).Value = txtFrom.Text;
        cmd.Parameters.Add("@to", SqlDbType.Date).Value = txtTo.Text;
        cmd.ExecuteNonQuery();


        MessageBox.Show("Record Inserted");
    }
}
