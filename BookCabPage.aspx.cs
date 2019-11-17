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
using System.Net.Mail;
using System.Net;

public partial class BookCabPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());

    public static int distance;
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
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "-1"));
            getData();
        }
    }
    void getData()
    {
        if (Page.Session["UserEmail"] == null)
        {
            Response.Redirect("UserSignIn.aspx?is=loginmust");
        }
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select * from tblUserSignUp where Email='" + Page.Session["UserEmail"].ToString() + "'";
        SqlDataReader dr;
        dr = com.ExecuteReader();

        if (dr.Read())
        {
           txtUserName.Text = dr["Name"].ToString();
        }
        con.Close();
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
        ddlPickUp.Items.Insert(0, new ListItem("--Select Area--", "-1"));
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
        ddlDrop.Items.Insert(0, new ListItem("--Select Area--", "-1"));
        string selectedArea = ddlPickUp.SelectedItem.Text;
        ddlDrop.Items.FindByText(selectedArea).Enabled = false;
    }
    void emptyControl()
    {
        txtDate.Text = String.Empty;
        txtPrice.Text = String.Empty;
        ddlCabType.Items.Clear();
        ddlCity.SelectedIndex =-1;
        ddlDrop.Items.Clear();
        ddlPickUp.Items.Clear();
        ddlTime.Items.Clear();
    }
    void showPrice()
    {
        try
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from [tblDistance] where Pick_up=@pickup and DropArea=@drop", con);
            cmd1.Parameters.AddWithValue("@pickup", ddlPickUp.SelectedValue);
            cmd1.Parameters.AddWithValue("@drop", ddlDrop.SelectedValue);
            SqlDataReader dr = cmd1.ExecuteReader();
            while(dr.Read())
            {
                distance =Int32.Parse(dr[4].ToString());
                if (ddlTime.SelectedIndex >=11 && ddlTime.SelectedIndex <=41)
                {
                    txtPrice.Text = dr[5].ToString();
                }
                else
                {
                    txtPrice.Text = dr[6].ToString();
                }
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
       DialogResult dr= MessageBox.Show("City\t"+ ddlCity.SelectedItem.ToString()+"\n"+
                        "Cab\t"+ddlCabType.SelectedValue.ToString()+"\n"+
                        "PickUp\t" + ddlPickUp.SelectedItem.ToString()+"\n"+
                        "Drop\t"+ddlDrop.SelectedItem.ToString()+"\n"+
                        "Date\t"+txtDate.Text+"\n"+
                        "Time\t" +ddlTime.SelectedValue.ToString()+ "\n"+
                        "Distance\t" +distance+ "KM"+"\n" +
                        "Price\t"+txtPrice.Text+ "Rs"+"\n","",
                        MessageBoxButtons.OKCancel);
       if (dr == DialogResult.OK)
       {
           try
           {
               con.Open();
               SqlCommand cmd = new SqlCommand("insert into tblBooking values(@user,@username,@city,@cab,@pickup,@drop,@date,@time,@distance,@price,'Panding')", con);
               cmd.Parameters.Add("@user", SqlDbType.NVarChar).Value = Session["UserEmail"].ToString();
               cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUserName.Text;
               cmd.Parameters.Add("@city", SqlDbType.Int).Value = ddlCity.SelectedValue.ToString();
               cmd.Parameters.Add("@cab", SqlDbType.NVarChar).Value = ddlCabType.SelectedValue.ToString();
               cmd.Parameters.Add("@pickup", SqlDbType.Int).Value = ddlPickUp.SelectedValue.ToString();
               cmd.Parameters.Add("@drop", SqlDbType.Int).Value = ddlDrop.SelectedValue.ToString();
               cmd.Parameters.Add("@date", SqlDbType.NVarChar).Value = txtDate.Text;
               cmd.Parameters.Add("@time", SqlDbType.VarChar).Value = ddlTime.SelectedValue.ToString();
               cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = txtPrice.Text;
               cmd.Parameters.Add("@distance", SqlDbType.Int).Value =distance;
               cmd.ExecuteNonQuery();
               sendEmail();
               emptyControl();
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
    protected void ddlDrop_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void ddlTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        showPrice();
    }
    void sendEmail() {
        string senderEmailId = "jaiminbhut35@gmail.com";
        string password = "fantona#73min";
       // string receiversEmailId = "jaiminbhut7love@gmail.com";
        string receiversEmailId = Page.Session["UserEmail"].ToString();
        string subject = "Booking Confirm";
        string body = "Journey:\t\t" + ddlPickUp.SelectedItem.ToString() + "   " + "To   " + ddlDrop.SelectedItem.ToString() +
            "\nName:\t\t" + txtUserName.Text +
            "\nDate:\t\t" + txtDate.Text + "  YYYY-MM-DD" +
            "\nTime:\t\t" + ddlTime.SelectedItem.ToString() +
            "\nCab Number:\t" + ddlCabType.SelectedValue.ToString() +
            "\nCab Name:\t" + ddlCabType.SelectedItem.ToString() +
            "\nCharge:\t\t" + txtPrice.Text + "\nThank You,\nHave A Nice Journey";
        using (MailMessage mm = new MailMessage(senderEmailId, receiversEmailId))
        {
            mm.Subject = subject;
            mm.Body = body;
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential(senderEmailId, password);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
        }
    }
    protected void SendEmail(object sender, EventArgs e)
    {
       // string senderEmailId = "bhutjem@gmail.com";
       // string password="fantona#73min";
       // string receiversEmailId = "jaiminbhut7love@gmail.com";
       //// string receiversEmailId = Page.Session["UserEmail"].ToString();
       // string subject = "Booking Confirm";
       // string body = "Journey:\t\t" + ddlPickUp.SelectedItem.ToString() + "   " + "To   " + ddlDrop.SelectedItem.ToString() +
       //     "\nName:\t\t" + txtUserName.Text +
       //     "\nDate:\t\t" + txtDate.Text + "  YYYY-MM-DD" +
       //     "\nTime:\t\t" + ddlTime.SelectedItem.ToString() +
       //     "\nCab Number:\t" + ddlCabType.SelectedValue.ToString() +
       //     "\nCab Name:\t" + ddlCabType.SelectedItem.ToString() +
       //     "\nCharge:\t\t" + txtPrice.Text + "";
       // using (MailMessage mm = new MailMessage(senderEmailId,receiversEmailId))
       // {
       //     mm.Subject = subject;
       //     mm.Body = body;
       //     mm.IsBodyHtml = false;
       //     SmtpClient smtp = new SmtpClient();
       //     smtp.Host = "smtp.gmail.com";
       //     smtp.EnableSsl = true;
       //     NetworkCredential NetworkCred = new NetworkCredential(senderEmailId,password);
       //     smtp.UseDefaultCredentials = true;
       //     smtp.Credentials = NetworkCred;
       //     smtp.Port = 587;
       //     smtp.Send(mm);
       //     ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
       // }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != "")
        {
            Session.Clear();
            Response.Redirect("SignInMain.aspx");
        }
        else
        {
            MessageBox.Show("Opps!You Not Sign In");
        }
    }
}