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

namespace Group17Assignment1
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string querry = " SELECT QuestionID,QuestionContent FROM SecurityQuestion";
                SqlCommand cmd = new SqlCommand(querry, con);
                con.Open();
                Question.DataSource = cmd.ExecuteReader();
                Question.DataBind();
                con.Close();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                int QuestionID = Convert.ToInt32(Question.SelectedValue);

                string query1 = "INSERT INTO [User](QuestionID,Password,Email,Address,SecurityAnswer,LastName,FirstName) VALUES(" + QuestionID + ",'"
               + Password.Text + "','" + Email.Text + "','" + Address.Text + "','" + Answer.Text + "','" + LastName.Text + "','" + FirstName.Text + "')";

                SqlCommand cmd = new SqlCommand(query1, con);
                string query2 = "INSERT INTO [UserRole] (UserID,RoleID) VALUES ((SELECT UserID FROM [User] WHERE Email='" + Email.Text + "'),3)";

                SqlCommand cmd2 = new SqlCommand(query2, con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
                Session["Success"] = true;
                Response.Redirect("/login");

            }


        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/login");
        }


        protected void UsernameChecker_ServerValidate(object source, ServerValidateEventArgs args)
        {

            string user = Email.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + user + "'", con);
            SqlDataReader read = cmd.ExecuteReader();
            if (read.HasRows)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
            con.Close();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = AgreetoTerms.Checked;
        }
    }
}