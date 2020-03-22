using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Group17Assignment1
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        public static string sqlConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 3)
            {
                Response.Redirect("/login");
            }
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    con.Open();
                    string getIncidentQuery = "SELECT IncidentID, CONCAT(IncidentID,'. ',' Incident for Product, ', Status, ', ' ,ReportDate, ' - ', Description) as combind FROM [Incident] WHERE UserID = @UserID";
                    SqlCommand getIncidentCmd = new SqlCommand(getIncidentQuery, con);
                    getIncidentCmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                    txtCustomerID.Text = Session["UserID"].ToString();
                    ListBoxIncident.DataSource = getIncidentCmd.ExecuteReader();
                    ListBoxIncident.DataTextField = "combind";
                    ListBoxIncident.DataValueField = "IncidentID";
                    ListBoxIncident.DataBind();
                    con.Close();
                }

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
              Session.Abandon();
              Response.Redirect("/login");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(ListBoxIncident.SelectedIndex == -1)
            {
                listSelectValidate.Text = "Please select an incident";
            }
            else
            {
                listSelectValidate.Text = "";
                using(SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    int IncidentID = Convert.ToInt32(ListBoxIncident.SelectedValue);
                    int UserID = Convert.ToInt32(txtCustomerID.Text);
                    int ContactBack = (contactMethod.Checked == true) ? 1 : 0;
                    string insertSurvey = "INSERT INTO [Survey](UserID,IncidentID,ResponseTime,Efficiency,Resolution,ContactBack,ContactMethod) VALUES(" + UserID + ",'"
                    + IncidentID + "','" + RspTimeList.SelectedValue + "','" + TechEffList.SelectedValue + "','" + ProbResolutionList.SelectedValue + "','" + ContactBack + "','" + contactMethodList.SelectedValue + "')";
                    SqlCommand InsertCommand = new SqlCommand(insertSurvey,con);
                    con.Open();
                    InsertCommand.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("/customer/surveyconfirm");
                }
            }
        }
    }
}