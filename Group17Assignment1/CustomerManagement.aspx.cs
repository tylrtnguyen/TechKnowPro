using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Group17Assignment1
{
    public partial class CustomerManagement : System.Web.UI.Page
    {
       
        public static string sqlConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
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
        }

        protected int EmailExist(string email)
        {
            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();
                string checkQuery = "SELECT COUNT(1) FROM [Survey] where UserID = @userID";
                SqlCommand sqlCmd = new SqlCommand(checkQuery, con);
                sqlCmd.Parameters.AddWithValue("@userID", ddlCustomers.SelectedItem.Value);
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                con.Close();
                return count;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int check = EmailExist(txtEmail.Text);
            if (check == 1)
            {
                string querry = "UPDATE [Survey] set ContactBack = 1 where userID = " + ddlCustomers.SelectedItem.Value;
                SqlConnection con = new SqlConnection(sqlConnectionString);
                SqlCommand cmd = new SqlCommand(querry, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string querry = "INSERT INTO Survey(UserID, IncidentID, ResponseTime, Efficiency, Resolution, Comment, ContactBack,ContactMethod) VALUES(@userID,@incidientID,@responsetime,@efficiency,@resolution,@comment,@contactback,@contactmethod)";
               
                SqlConnection con = new SqlConnection(sqlConnectionString);
                SqlCommand cmd = new SqlCommand(querry, con);
                cmd.Parameters.AddWithValue("@userID", ddlCustomers.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@incidientID",1);
                cmd.Parameters.AddWithValue("@responsetime", "request by technician");
                cmd.Parameters.AddWithValue("@efficiency", "request by technician");
                cmd.Parameters.AddWithValue("@resolution", "request by technician");
                cmd.Parameters.AddWithValue("@comment", "request by technician");
                cmd.Parameters.AddWithValue("@contactback", 1);
                cmd.Parameters.AddWithValue("@contactmethod", "request by technician");
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                
            }

           
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login");
        }

        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCustomers.SelectedItem.Value != "0")
            {
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("Select Email, Address, PhoneNumber from [User] where UserID = @UserID", con))
                    {
                        using (SqlDataAdapter addp = new SqlDataAdapter(cmd))
                        {
                            cmd.Parameters.AddWithValue("@UserID", ddlCustomers.SelectedItem.Value);
                            con.Open();
                            DataTable dt = new DataTable();
                            addp.Fill(dt);
                            txtAddress.Text = dt.Rows[0]["Address"].ToString();
                            txtEmail.Text = dt.Rows[0]["Email"].ToString();
                            txtPhone.Text = dt.Rows[0]["PhoneNumber"].ToString();
                            con.Close();
                        }
                    }
                }
            }
        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("/contactlist");
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
            else if(Convert.ToInt32(Session["author"]) == 2)
            {
                Response.Redirect("technician/home");
            }
        }
    }
}