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
using System.Web.UI.WebControls;

public partial class Farecharges : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();
        }
    }
    void disp()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from tblFarecharges", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt1 = new DataTable();
        da.Fill(dt1);
        gvData.DataSource = dt1;
        gvData.DataBind();
        con.Close();

    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblFarecharges  values(@b4kmDay,@b4kmNight,@a4kmDay,@a4kmNight,@wDay,@wNight)", con);
         //   cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue;
            cmd.Parameters.Add("@b4kmDay", SqlDbType.Decimal).Value = txtB4kmDay.Text;
            cmd.Parameters.Add("@b4kmNight", SqlDbType.Decimal).Value = txtB4kmNight.Text.Trim().ToUpper();
            cmd.Parameters.Add("@a4kmDay", SqlDbType.Decimal).Value = txtA4kmDay.Text;
            cmd.Parameters.Add("@a4kmNight", SqlDbType.Decimal).Value = txtA4kmNight.Text;
            cmd.Parameters.Add("@wDay", SqlDbType.Decimal).Value = txtWaitChargeDay.Text;
            cmd.Parameters.Add("@wNight", SqlDbType.Decimal).Value = txtWaitChargeNight.Text;
            cmd.ExecuteNonQuery();
            MessageBox.Show("Data Inserted");
            disp();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }
      //  MessageBox.Show("Record Inserted");

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
        int DelId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from tblFarecharges Where Id=" + DelId, con);
        cmd.ExecuteNonQuery();
        con.Close();
        disp();
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        HiddenField field = gvData.Rows[e.RowIndex].FindControl("hiddenId") as HiddenField;
       // System.Web.UI.WebControls.TextBox city = gvData.Rows[e.RowIndex].FindControl("txtCity") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox bDay = gvData.Rows[e.RowIndex].FindControl("txtBday") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox bNight = gvData.Rows[e.RowIndex].FindControl("txtBNight") as System.Web.UI.WebControls.TextBox; 
        System.Web.UI.WebControls.TextBox aDay = gvData.Rows[e.RowIndex].FindControl("txtAday") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox aNight = gvData.Rows[e.RowIndex].FindControl("txtAnight") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox wDay = gvData.Rows[e.RowIndex].FindControl("txtWday") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox wNight = gvData.Rows[e.RowIndex].FindControl("txtWnight") as System.Web.UI.WebControls.TextBox;
        System.Web.UI.WebControls.TextBox txtname = gvData.Rows[e.RowIndex].FindControl("txtArea") as System.Web.UI.WebControls.TextBox;
        con.Open();
        SqlCommand cmd = new SqlCommand
        ("update tblFarecharges set before_4km_Day=@b4kmDay,before_4km_Night=@b4kmNight,after_4km_Day=@a4kmDay,after_4km_Night=@a4kmNight,waiting_charge_Day=@wDay,waiting_charge_Night=@wNight where Id='" + UpdateId + "'", con);
        cmd.Parameters.Add("@b4kmDay", SqlDbType.Decimal).Value = bDay.Text;
        cmd.Parameters.Add("@b4kmNight", SqlDbType.Decimal).Value = bNight.Text;
        cmd.Parameters.Add("@a4kmDay", SqlDbType.Decimal).Value = aDay.Text;
        cmd.Parameters.Add("@a4kmNight", SqlDbType.Decimal).Value = aNight.Text;
        cmd.Parameters.Add("@wDay", SqlDbType.Decimal).Value = wDay.Text;
        cmd.Parameters.Add("@wNight", SqlDbType.Decimal).Value = wNight.Text;
        Response.Write(cmd.CommandText);
        cmd.ExecuteNonQuery();
        con.Close();
        gvData.EditIndex = -1;
        disp();
    }
}