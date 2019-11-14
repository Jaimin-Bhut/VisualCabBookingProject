using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class AddCharges : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack)
        //{
            city();
            disp();
       // }
    }
    void city()
    {
        SqlCommand cmd = new SqlCommand("select * from tblCity", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "Id";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
        ddlCity.SelectedIndex = 0;

    }
    void disp()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Select d.Distance_id,c.City,c.Id,d.City_id,d.Pick_up,d.DropArea,d.Distance,d.DayPrice,d.NightPrice,a.Id,a.Area,b.Area from tblDistance d,tblCity c,tblArea a,tblArea b where d.Pick_up=a.Id and b.Id=d.DropArea and c.Id=d.City_id and a.City_id=d.City_id and b.City_id=d.City_id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            gvData.DataSource = dt1;
            gvData.DataBind();
          
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
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
        try
        {
            int DelId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblDistance Where Distance_id=" + DelId, con);
            cmd.ExecuteNonQuery();
            con.Close();
            disp();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvData.EditIndex = e.NewEditIndex;
        disp();
    }
    protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label id = gvData.Rows[e.RowIndex].FindControl("lid") as Label;
            int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            DropDownList updateCity = gvData.Rows[e.RowIndex].FindControl("gvddlCity") as DropDownList;
            DropDownList updateFrom = gvData.Rows[e.RowIndex].FindControl("gvddlFrom") as DropDownList;
            DropDownList updateTo = gvData.Rows[e.RowIndex].FindControl("gvddlTo") as DropDownList;
            TextBox updateDistace = gvData.Rows[e.RowIndex].FindControl("gvtxtDistance") as TextBox;
            TextBox updateDayPrice = gvData.Rows[e.RowIndex].FindControl("gvtxtDayPrice") as TextBox;
            TextBox updateNightPrice = gvData.Rows[e.RowIndex].FindControl("gvtxtNightPrice") as TextBox;
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblDistance set Distance ='" + updateDistace.Text + "',DayPrice='" + updateDayPrice.Text + "',NightPrice='"+updateNightPrice.Text+"' where Distance_id= '" + UpdateId+"'", con);
            Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            disp();
            con.Close();
            gvData.EditIndex = -1;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnDone_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd1 = new SqlCommand("select count(*) from tblDistance where Pick_up ='" + ddlFrom.SelectedValue.ToString() + "' and DropArea ='"+ddlTo.SelectedValue.ToString()+"'", con);
        int c1 = Int32.Parse(cmd1.ExecuteScalar().ToString());
        if (c1 == 1)
        {
            lblError.Text="Charges Already Available";

        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into tblDistance values(@city,@from,@to,@distance,@dayprice,@nightprice)", con);
            cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue.ToString();
            cmd.Parameters.Add("@from", SqlDbType.Int).Value = ddlFrom.SelectedValue.ToString();
            cmd.Parameters.Add("@to", SqlDbType.Int).Value = ddlTo.SelectedValue.ToString();
            cmd.Parameters.Add("@distance", SqlDbType.Int).Value = txtDistance.Text.Trim();
            cmd.Parameters.Add("@dayprice", SqlDbType.Int).Value = txtDayPrice.Text.Trim();
            cmd.Parameters.Add("@nightprice", SqlDbType.Int).Value = txtNightPrice.Text.Trim();
            cmd.ExecuteNonQuery();
            disp();
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlFrom.DataSource = dt;
        ddlFrom.DataBind();
        ddlFrom.DataTextField = "Area";
        ddlFrom.DataValueField = "Id";
        ddlFrom.DataBind();
        ddlFrom.Items.Insert(0, new ListItem("--Select Area--", "0"));
        ddlFrom.SelectedIndex = 0;
    }
    void gvCity(GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                con.Open();
                // var dropdown = (DropDownList)e.Row.FindControl("gvddlCity");
                DropDownList gvddlCity = (e.Row.FindControl("gvddlCity") as DropDownList);
                string query = "select * from tblCity";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter daa = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                daa.Fill(dt);
                gvddlCity.DataSource = dt;
                gvddlCity.DataValueField = "Id";
                gvddlCity.DataTextField = "City";
                gvddlCity.DataBind();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList gvddlCity = (FindControl("gvddlCity") as DropDownList);
        DropDownList gvddlFrom = (FindControl("gvddlFrom") as DropDownList);
        SqlCommand cmd = new SqlCommand("select * from tblArea Where City_id ='" + gvddlCity.SelectedValue.ToString() + "'", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "Area";
        ddlCity.DataValueField = "Id";
        ddlCity.DataBind();
        disp();
    }
    protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlTo.DataSource = dt;
        ddlTo.DataBind();
        ddlTo.DataTextField = "Area";
        ddlTo.DataValueField = "Id";
        ddlTo.DataBind();
        ddlTo.Items.Insert(0, new ListItem("--Select Area--", "0"));
        ddlTo.SelectedIndex = 0;
        string selectedArea = ddlFrom.SelectedItem.Text;
        ddlTo.Items.FindByText(selectedArea).Enabled = false;
    }
    protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtDayPrice.Text =String.Empty;
        txtDistance.Text = String.Empty;
        txtNightPrice.Text = String.Empty;
    }
}