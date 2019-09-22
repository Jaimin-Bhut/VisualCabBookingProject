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

public partial class UserSignUp : System.Web.UI.Page
{
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    this.MasterPageFile = "~/MasterPage1.master";
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            SqlCommand cmd = new SqlCommand("select * from tblCity ", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
        }
       
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblUserSignUp  values(@name,@add,@city,@contact,@email,@pass)", con);
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtName.Text.Trim().ToUpper();
            cmd.Parameters.Add("@add", SqlDbType.NVarChar).Value = txtAddress.Text.Trim().ToUpper();
            cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue;
            cmd.Parameters.Add("@contact", SqlDbType.NVarChar).Value = txtContactNo.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@pass", SqlDbType.NVarChar).Value = txtCPassword.Text;
            cmd.ExecuteNonQuery();
            MessageBox.Show("Record Inserted");
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }
    }
}