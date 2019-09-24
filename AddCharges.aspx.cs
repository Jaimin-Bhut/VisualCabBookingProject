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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            city();
            disp();
        }
    }
    void city()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from tblCity", con);
        SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        Adpt.Fill(dt);
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "Id";
        ddlCity.DataBind();
    }
    void area2()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlTo.DataSource = dt;
        ddlTo.DataBind();
        ddlTo.DataTextField = "Area";
        ddlTo.DataValueField = "Id";
        ddlTo.DataBind();
    }
    void area()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        string com = "Select * from tblArea where City_id ='" + ddlCity.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlFrom.DataSource = dt;
        ddlFrom.DataBind();
        ddlFrom.DataTextField = "Area";
        ddlFrom.DataValueField = "Id";
        ddlFrom.DataBind();
    }
    void disp()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand cmd = new SqlCommand("Select City,c.Id,Distance,Pick_up,Area,DropArea from tblArea a,tblCharges ch,tblCity c where a.City_id=c.Id and a.Id=ch.Pick_up", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt1 = new DataTable();
        da.Fill(dt1);
        gvData.DataSource = dt1;
        gvData.DataBind();
        con.Close();
    }
    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        gvCity(e);
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
        SqlCommand cmd = new SqlCommand("delete from tblCharges Where Id=" + DelId, con);
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
        Label id = gvData.Rows[e.RowIndex].FindControl("lid") as Label;
        int UpdateId = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        DropDownList updateCity = gvData.Rows[e.RowIndex].FindControl("gvddlCity") as DropDownList;
        DropDownList updateFrom = gvData.Rows[e.RowIndex].FindControl("gvddlFrom") as DropDownList;
        DropDownList updateTo = gvData.Rows[e.RowIndex].FindControl("gvddlTo") as DropDownList;
        TextBox updateDistace = gvData.Rows[e.RowIndex].FindControl("gvtxtDistance") as TextBox;
        //TextBox updatePrice = gvData.Rows[e.RowIndex].FindControl("gvtxtPrice") as TextBox;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tblCharges set City_id=" + updateCity.SelectedValue + ",From='" + updateFrom.SelectedValue + "',To ='" + updateTo.SelectedValue + "',Distance ='" + updateDistace.Text + "' where Id=" + UpdateId, con);
        Response.Write(cmd.CommandText);
        cmd.ExecuteNonQuery();
        disp();
        con.Close();
        gvData.EditIndex = -1;
    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblCharges values(@city,@from,@to,@distance)", con);
            cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue.ToString();
            cmd.Parameters.Add("@from", SqlDbType.Int).Value = ddlFrom.SelectedValue.ToString();
            cmd.Parameters.Add("@to", SqlDbType.Int).Value = ddlTo.SelectedValue.ToString();
            cmd.Parameters.Add("@distance", SqlDbType.Int).Value = txtDistance.Text.Trim();
            //cmd.Parameters.Add("@price", SqlDbType.Int).Value = txtPrice.Text.Trim();
            cmd.ExecuteNonQuery();
            disp();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        area();
        area2();
    }
    void gvCity(GridViewRowEventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            DropDownList gvddlCity = (e.Row.FindControl("gvddlCity") as DropDownList);
            SqlCommand cmd = new SqlCommand("select * from tblCity", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            gvddlCity.DataSource = dt1;
            gvddlCity.DataValueField = "Id";
            gvddlCity.DataTextField = "City";
            gvddlCity.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
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
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}