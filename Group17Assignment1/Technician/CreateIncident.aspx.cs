using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1
{
    public partial class createIncident : System.Web.UI.Page
    {

        public static string dbs = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
        string incidentDes;
        string contact;
        string incidentStatus;
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            incidentStatus = ddlStatus.SelectedItem.Value;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                errorMessage.Text = "Denotes are required";
            }
            int n;
            contact = RadioButtonList1.SelectedValue;
            incidentDes = txtIncidentDes.Text;
            incidentStatus = ddlStatus.SelectedValue;

            DateTime reportDate = DateTime.Now;
            SqlDataSource1.DataBind();
            using (SqlConnection con = new SqlConnection(dbs))
            {
                using (SqlCommand command = new SqlCommand(" Insert into [Incident] (UserID,Title,Status,Description,ReportDate) values ( @UserID,@Title, @Status, @Description, @ReportDate )", con))
                {
                    command.Parameters.AddWithValue("@UserID", Convert.ToInt32(txtCusID.Text));
                    command.Parameters.AddWithValue("@Title", "Incident for Customer#" + Convert.ToInt32(txtCusID.Text));
                    command.Parameters.AddWithValue("@Status", incidentStatus);
                    command.Parameters.AddWithValue("@Description", incidentDes);
                    command.Parameters.AddWithValue("@ReportDate", reportDate);
                    con.Open();
                    n = command.ExecuteNonQuery();
                    con.Close();
                }
            }
            if (n > 0)
            {
                lblInform.Text = "Successfully added!!!";
                txtIncidentDes.Text = "";
                ddlStatus.SelectedItem.Value = "NEW";
            }
            else
            {
                lblInform.Text = "Failed";
                txtIncidentDes.Text = "";
                ddlStatus.SelectedItem.Value = "NEW";
            }

        }

        protected void ddlCus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int incidentId;
            if (RadioButtonList1.SelectedIndex > -1)
            {
                contact = RadioButtonList1.SelectedValue;
            }
            incidentDes = txtIncidentDes.Text;
            if (ddlCus.SelectedItem.Value != "0")
            {

                string userID = ddlCus.SelectedItem.Value;
                SqlDataSource1.DataBind();

                using (SqlConnection con = new SqlConnection(dbs))
                {
                    using (SqlCommand command = new SqlCommand("Select [User].userID from [User] where userID = " + userID, con))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            con.Open();
                            DataTable tbl = new DataTable();
                            adapter.Fill(tbl);
                            txtCusID.Text = tbl.Rows[0]["userID"].ToString();

                            txtCurrTime.Text = DateTime.Now.ToString("M/d/yyyy HH:mm");
                            con.Close();
                        }
                    }
                    using (SqlCommand comd = new SqlCommand(" Select IncidentID from [Incident]", con))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(comd))
                        {
                            con.Open();
                            DataTable tbl = new DataTable();
                            adapter.Fill(tbl);
                            incidentId = Convert.ToInt32(tbl.Rows[0]["IncidentID"]) + 1;
                            txtIncidentID.Text = incidentId.ToString();
                            con.Close();
                            //not finished
                        }
                    }
                }
            }
        }

        protected void txtIncidentDes_TextChanged(object sender, EventArgs e)
        {
            incidentDes = txtIncidentDes.Text;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            contact = RadioButtonList1.SelectedValue;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/login");
        }
    }

}
