using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewBill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("Select *from tblFeedback", con);
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            gvData.DataSource = Dt;
            gvData.DataBind();
            con.Close();
        }
    }
}