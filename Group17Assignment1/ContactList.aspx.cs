using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1
{
    public partial class ContactList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Prevent user from loggin in by typing URL
            if (Convert.ToBoolean(Session["check"]) != true)
            {
                Response.Redirect("/login");
            }
            //Prevent customer from loggin in the system
            else if (Convert.ToInt32(Session["author"]) != 1 && Convert.ToInt32(Session["author"]) != 2)
            {
                Response.Redirect("/login");
            }
           if(!IsPostBack)
            {
                string querry = "SELECT ([User].Address + ' ' + [User].Email) as combind, [User].userID, [Survey].SurveyID from [User] JOIN [Survey] ON [User].UserID = [Survey].UserID WHERE [Survey].ContactBack = 1";
                SqlCommand cmd = new SqlCommand(querry, con);
                con.Open();             
                ListBox1.DataTextField = "combind";                               
                ListBox1.DataValueField = "SurveyID";
                ListBox1.DataSource = cmd.ExecuteReader();
                ListBox1.DataBind();
                con.Close();
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            string querry = "UPDATE [Survey] set ContactBack = 0";
            SqlCommand cmd = new SqlCommand(querry, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("/customers");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if(ListBox1.SelectedItem != null)
            {
                string querry = "UPDATE [Survey] set ContactBack = 0 where SurveyID = " + ListBox1.SelectedValue;
                SqlCommand cmd = new SqlCommand(querry, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("/contactlist");
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "Hmmm! It seems like the list is empty";
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/customers");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("Login.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["author"]) == 1)
            {
                Response.Redirect("admin/home");
            }
            else if(Convert.ToInt32(Session["author"])==2){
                Response.Redirect("technician/home");
            }
        }
    }
}