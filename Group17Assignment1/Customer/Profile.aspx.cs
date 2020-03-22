using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using Group17Assignment1.Model;

namespace Group17Assignment1
{   
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 3)
            {
                Response.Redirect("/login");
            }
            if (!Page.IsPostBack)
            {
                //Set user info
                Customers currentCustomer = GetCustomerInfo();
                txtFirstName.Text = currentCustomer.FirstName;
                txtLastName.Text = currentCustomer.LastName;
                txtAddress.Text = currentCustomer.Address;
                txtEmail.Text = currentCustomer.Email;
                //Select user security question
                string questionID = Convert.ToString(currentCustomer.QuestionID);
                ddlQuestion.SelectedValue = questionID;  
            }
        }
        protected Customers GetCustomerInfo()
        {
            string getCusInfo = "SELECT QuestionID, FirstName, LastName, Email, Address FROM [User] WHERE [UserID] = @UserID";
            SqlCommand getCusInfoCmd = new SqlCommand(getCusInfo, connection);
            getCusInfoCmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            SqlDataAdapter adap = new SqlDataAdapter(getCusInfoCmd);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Customers currentCustomer = new Customers
            {
                QuestionID = Convert.ToInt32(dt.Rows[0]["QuestionID"]),
                FirstName = dt.Rows[0]["FirstName"].ToString(),
                LastName = dt.Rows[0]["LastName"].ToString(),
                Email = dt.Rows[0]["Email"].ToString(),
                Address = dt.Rows[0]["Address"].ToString()
            };
            return currentCustomer;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                int QuestionID = Convert.ToInt32(ddlQuestion.SelectedValue);
                string query1 = "UPDATE [User] SET QuestionID ='" + QuestionID + "', Password = '" + txtPassword.Text +
                                "', Email ='" +txtEmail.Text+"', Address = '"+ txtAddress.Text +
                                "', SecurityAnswer = '" + txtAnswer.Text + "', LastName = '" + txtLastName.Text +
                                "', FirstName = '" + txtFirstName.Text + "' WHERE userID = " + Convert.ToInt32(Session["UserID"]);                
                SqlCommand cmd = new SqlCommand(query1, connection);
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                Server.Transfer("CustomerHome.aspx");

            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHome.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("~/Login.aspx",true);
        }
    }
}