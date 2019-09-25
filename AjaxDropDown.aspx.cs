using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AjaxDropDown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = "select *from tblState";
            BindDropDownList(ddlState, query, "State", "Id", "Select State");
            ddlCity.Enabled = false;
            ddlArea.Enabled = false;
            ddlCity.Items.Insert(0, new ListItem("Select City", "0"));
            ddlArea.Items.Insert(0, new ListItem("Select Area", "0"));
        }
    }
    private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                con.Open();
                ddl.DataSource = cmd.ExecuteReader();
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                con.Close();
            }
        }
        ddl.Items.Insert(0, new ListItem(defaultText, "0"));
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCity.Enabled = false;
        ddlArea.Enabled = false;
        ddlCity.Items.Clear();
        ddlArea.Items.Clear();
        ddlCity.Items.Insert(0, new ListItem("Select City", "0"));
        ddlArea.Items.Insert(0, new ListItem("Select Area", "0"));
        int SId = int.Parse(ddlState.SelectedItem.Value);
        if (SId > 0)
        {
            string query = string.Format("select *from tblCity where State_id = {0}", SId);
            BindDropDownList(ddlCity, query, "City", "Id", "Select City");
            ddlCity.Enabled = true;
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlArea.Enabled = false;
        ddlArea.Items.Clear();
        ddlArea.Items.Insert(0, new ListItem("Select Area", "0"));
        int CId = int.Parse(ddlCity.SelectedItem.Value);
        if (CId > 0)
        {
            string query = string.Format("select *from tblArea where City_id = {0}", CId);
            BindDropDownList(ddlArea, query, "Area", "Id", "Select Area");
            ddlArea.Enabled = true;
        }
    }
    protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}