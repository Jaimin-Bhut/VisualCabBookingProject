﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;


public partial class AddCab : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/MasterPage1.master";
    }

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
            ddlCity.DataBind();
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            //txtCabName.Text = "";
            //txtCabNo.Text = "";
            //txtLuggCapacity.Text = "";
            //txtPerCapacity.Text = "";
        }

    }
    protected void btnAddCab_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblCab values('" + txtCabNo.Text.Trim().ToUpper() + "','" + txtCabName.Text.Trim().ToUpper() + "','" + ddlCabType.SelectedValue.Trim().ToUpper() + "','" + txtPerCapacity.Text.Trim() + "','" + txtLuggCapacity.Text.Trim() + "','" + ddlCity.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write(cmd.CommandText);
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
       /* cmd.Parameters.AddWithValue("Cab_Id",SqlDbType.Int).Value=txtCabNo.Text;
        cmd.Parameters.AddWithValue("Cab_name", txtCabName.Text);
        cmd.Parameters.AddWithValue("Cab_type", ddlCabType.SelectedValue);
        cmd.Parameters.AddWithValue("Person_capacity", txtPerCapacity.Text);
        cmd.Parameters.AddWithValue("Lougage_capacity", txtLuggCapacity.Text);
        cmd.Parameters.AddWithValue("Price_per_Km", txtPricePerKm.Text);
        cmd.Parameters.AddWithValue("Working_City", ddlCity.SelectedValue); 
    */
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