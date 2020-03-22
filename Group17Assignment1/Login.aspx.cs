using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Group17Assignment1.Model;

namespace Group17Assignment1
{
    public partial class Login : System.Web.UI.Page
    {
        public static string sqlConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {

            DivAlert.Visible = Convert.ToBoolean(Session["Success"]);

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Response.Redirect("customer/register");
        }
        protected int logInValidate(string email, string password)
        {
            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();
                string checkQuery = "SELECT COUNT(1) FROM [User] where Email = @email AND Password = @password";
                SqlCommand sqlCmd = new SqlCommand(checkQuery, con);
                sqlCmd.Parameters.AddWithValue("@email", email);
                sqlCmd.Parameters.AddWithValue("@password", password);
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                con.Close();
                return count;

            }
        }

        //Function to define User's Role
        protected int getRoleId(string email)
        {
            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                string RoleIdQuery = "SELECT RoleID FROM [UserRole] where UserID IN (SELECT UserID FROM [User] WHERE Email = @email)";
                SqlCommand RoleIdCmd = new SqlCommand(RoleIdQuery, con);
                RoleIdCmd.Parameters.AddWithValue("@email", email);
                con.Open();
                int RoleID = Convert.ToInt32(RoleIdCmd.ExecuteScalar());
                return RoleID;
            }

        }
        
        protected Customers getUserInfo(string email)
        {
            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();
                string getNameQuery = "SELECT UserID, FirstName From [User] WHERE Email = @email";
                SqlCommand getNameCmd = new SqlCommand(getNameQuery, con);
                getNameCmd.Parameters.AddWithValue("@email", email);
                SqlDataAdapter adap = new SqlDataAdapter(getNameCmd);
                DataTable dt = new DataTable();
                adap.Fill(dt);
                Customers cus = new Customers
                {
                    UserID = Convert.ToInt32(dt.Rows[0]["UserID"]),
                    FirstName = dt.Rows[0]["FirstName"].ToString()
                };
                return cus;
            }
        }
        protected void btnLogin_Click1(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();
                string email = Email.Text;
                string password = Password.Text;
                int count = logInValidate(email, password);
                if (count == 1)
                {
                    int RoleId = getRoleId(email);
                    Customers cus = getUserInfo(email);
                    switch (RoleId)
                    {
                        case 1:
                            Session["check"] = true;
                            Session["author"] = 1;
                            Response.Redirect("admin/home");
                            break;
                        case 2:
                            Session["check"] = true;
                            Session["author"] = 2;
                            Response.Redirect("technician/home");
                            break;
                        case 3:
                            Session["check"] = true;
                            Session["author"] = 3;
                            Session["UserID"] = cus.UserID;
                            Session["FirstName"] = cus.FirstName;
                            Response.Redirect("/customer/home");
                            break;
                    }
                }
                else { Error.Text = "Invalid Email/Password"; }
                con.Close();
            }
        }
    }
}