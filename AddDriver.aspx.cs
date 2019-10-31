using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;

public partial class AddDriver : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }
    void Cab()
    {
        SqlCommand cmd = new SqlCommand("select * from tblCab ", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCab.DataSource = dt;
        ddlCab.DataBind();
        ddlCab.DataTextField = "Cab_name";
        ddlCab.DataValueField = "Cab_Id";
        ddlCab.DataBind();

    }
    void disp()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select Driver_img,Driver_Name,Driver_Address,City,Driver_Contact,Driver_Email,Cab_Id from tblDriver d,tblCity c where d.Driver_City=c.Id", con);
        SqlDataAdapter Adp = new SqlDataAdapter(cmd);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        gvData.DataSource = Dt;
        gvData.DataBind();
        con.Close();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select * from tblCity ", con);
            SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataBind();
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
            disp();
            Cab();
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select * from tblCab Where Working_City ='" + ddlCity.SelectedValue.ToString() + "'", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCab.DataSource = dt;
        ddlCab.DataTextField = "Cab_name";
        ddlCab.DataValueField = "Cab_Id";
        ddlCab.DataBind();
    }
    protected void btnAddDriver_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblDriver(Driver_img,Driver_Name,Driver_Address,Driver_city,Driver_Contact,Driver_Email,Driver_Password,Cab_Id) values(@dimg,@dname,@dadd,@dcity,@dcontact,@demail,@dpass,@cabid)", con);
        Response.Write(cmd.CommandText);
        cmd.Parameters.Add("@dimg", SqlDbType.NVarChar).Value = "~/Upload/" + FileUpload1.FileName;
        cmd.Parameters.Add("@dname", SqlDbType.VarChar).Value = txtDriverName.Text.Trim().ToUpper();
        cmd.Parameters.Add("@dadd", SqlDbType.VarChar).Value = txtDriverAdd.Text.Trim().ToUpper();
        cmd.Parameters.Add("@dcity", SqlDbType.Int).Value = ddlCity.SelectedValue;
        cmd.Parameters.Add("@dcontact", SqlDbType.NVarChar).Value = txtContact.Text;
        cmd.Parameters.Add("@demail", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("@dpass", SqlDbType.NVarChar).Value = txtCPassword.Text;
        cmd.Parameters.Add("@cabid", SqlDbType.NVarChar).Value = ddlCab.SelectedValue.Trim().ToUpper();
        cmd.ExecuteNonQuery();
        FileUpload1.SaveAs(Server.MapPath("~/Upload/") + FileUpload1.FileName);
        MessageBox.Show("Record Inserted");
    }

    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string UpdateId = (gvData.DataKeys[e.RowIndex].Value.ToString());
            FileUpload Fu=(FileUpload)(gvData.Rows[e.RowIndex].FindControl("gvFileUpload"));
            string img = (gvData.Rows[e.RowIndex].FindControl("gvFileUpload") as System.Web.UI.WebControls.FileUpload).FileName;
            string address = (gvData.Rows[e.RowIndex].FindControl("txtD_address") as System.Web.UI.WebControls.TextBox).Text;
            string city = (gvData.Rows[e.RowIndex].FindControl("gvddlCity") as DropDownList).SelectedValue.ToString();
            string contact = (gvData.Rows[e.RowIndex].FindControl("txtD_contact") as System.Web.UI.WebControls.TextBox).Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblDriver set Driver_img='" + Fu.FileName + "',Driver_Address ='" + address + "',Driver_City='" + city + "',Driver_Contact ='" + contact + "' where Driver_Email='" + UpdateId + "'", con);
            cmd.ExecuteNonQuery();
            FileUpload1.SaveAs(Server.MapPath("~/Upload/") + FileUpload1.FileName);

            con.Close();
            gvData.EditIndex = -1;
            disp();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string delId = (gvData.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblDriver Where Driver_Email='"+delId+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            disp();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }

    }
    protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvData.EditIndex = -1;
        disp();
    }
}