using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1.Admin
{
    public partial class ViewSurvey : System.Web.UI.Page
    {
        public static string sqlConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 1)
            {
                Response.Redirect("/login");
            }
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                using(SqlCommand cmd = new SqlCommand("SELECT ResponseTime, Efficiency, Resolution, Comment, ContactBack," +
                                                        "ContactMethod FROM [Survey] WHERE SurveyID = @SurveyID",con))
                {
                    using (SqlDataAdapter addp = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@SurveyID", ListBox1.SelectedValue);
                        con.Open();
                        DataTable dt = new DataTable();
                        addp.Fill(dt);
                        ResponseTime.Text = dt.Rows[0]["ResponseTime"].ToString();
                        TechEfficiency.Text = dt.Rows[0]["Efficiency"].ToString();
                        ProbResolution.Text = dt.Rows[0]["Resolution"].ToString();
                        txtAreaComment.Text = dt.Rows[0]["Comment"].ToString();
                        ContactMethod.Text = dt.Rows[0]["ContactMethod"].ToString();
                        //Define text for ContactBack Label
                        int ContactBackCheck = Convert.ToInt32(dt.Rows[0]["ContactBack"]);
                        ContactBack.Text = (ContactBackCheck == 0) ? "No" : "Yes";
                        con.Close();
                    }
                }
            }
        }
      
        protected void ddlSelectCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSelectCustomer.SelectedItem != null)
            {
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    //Command to retrieve user's survey for specific incident
                    using (SqlCommand cmd = new SqlCommand("SELECT SurveyID, (CONVERT(NVARCHAR(5),SurveyID) + '. survey for Incident ' +" +
                                                        " CONVERT(NVARCHAR(5),IncidentID)) as combind FROM [Survey] WHERE UserID = @UserID", con))
                    {
                            cmd.Parameters.AddWithValue("@UserID", ddlSelectCustomer.SelectedItem.Value);
                            con.Open();
                            ListBox1.DataTextField = "combind";
                            ListBox1.DataValueField = "SurveyID";
                            ListBox1.DataSource = cmd.ExecuteReader();
                            ListBox1.DataBind();
                            //Change Customer ID when selected index change
                            customerID.Text = ddlSelectCustomer.SelectedValue;
                            con.Close();
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/login");
        }
    }
}