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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
    //    protected void Page_PreInit(object sender, EventArgs e)
    //    {
    //        this.MasterPageFile = "~/MasterPage1.master";
    //    }
    void cab()
    {
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
            string com = "Select * from tblCity";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataBind();
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));

        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlPickUp.DataSource = dt;
        ddlPickUp.DataBind();
        ddlPickUp.DataTextField = "Area";
        ddlPickUp.DataValueField = "Id";
        ddlPickUp.DataBind();
        ddlPickUp.Items.Insert(0, new ListItem("--Select Area--", "0"));
        cab();
    }
    protected void ddlCabType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlPickUp_SelectedIndexChanged(object sender, EventArgs e)
    {
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlDrop.DataSource = dt;
        ddlDrop.DataBind();
        ddlDrop.DataTextField = "Area";
        ddlDrop.DataValueField = "Id";
        ddlDrop.DataBind();
        ddlDrop.Items.Insert(0, new ListItem("--Select Area--", "0"));
        string selectedArea = ddlPickUp.SelectedItem.Text;
        ddlDrop.Items.FindByText(selectedArea).Enabled = false;
    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
       DialogResult dr= MessageBox.Show("City\t"+ ddlCity.SelectedItem.ToString()+"\n"+
                        "PickUp\t" + ddlPickUp.SelectedItem.ToString()+"\n"+
                        "Drop\t"+ddlDrop.SelectedItem.ToString()+"\n"+
                        "Date\t"+txtDate.Text+"\n"+
                        "Time\t" +txtTime.Text+ "\n", "", MessageBoxButtons.OKCancel);
       if (dr == DialogResult.OK)
       {
           try
           {
               con.Open();
               SqlCommand cmd = new SqlCommand("insert into tblBooking values(@user,@city,@pickup,@drop,@date,@time,'10','250','Panding')", con);
               cmd.Parameters.Add("@user", SqlDbType.NVarChar).Value = Session["email"].ToString();
               cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue.ToString();
               cmd.Parameters.Add("@pickup", SqlDbType.Int).Value = ddlPickUp.SelectedValue.ToString();
               cmd.Parameters.Add("@drop", SqlDbType.Int).Value = ddlDrop.SelectedValue.ToString();
               cmd.Parameters.Add("@date", SqlDbType.Date).Value = txtDate.Text;
               cmd.Parameters.Add("@time", SqlDbType.Time).Value = txtTime.Text;
               cmd.ExecuteNonQuery();
               con.Close();
           }
           catch (Exception ex)
           {
               Response.Write(ex);
           }
       }
       else if (dr == DialogResult.Cancel)
       {
       }
    }
}