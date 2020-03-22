
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
    public partial class viewIncident : System.Web.UI.Page
    {
        public static string dbs = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechKnowPro.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 2)
            {
                Response.Redirect("/login");
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddCustomers.SelectedItem != null)
            {
                libIncident.Items.Clear();
                SqlDataSource1.DataBind();
                using (SqlConnection con = new SqlConnection(dbs))
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT IncidentId, CONVERT(varchar(5),IncidentID) +', '+ Title +', '+ Status +', '+ CONVERT(varchar(5),ReportDate) as combind FROM [Incident] WHERE UserID = @UserID ", con))
                    {

                        cmd.Parameters.AddWithValue("@UserID", ddCustomers.SelectedItem.Value);
                        con.Open();
                        libIncident.DataTextField = "combind";
                        libIncident.DataValueField = "IncidentID";
                        libIncident.DataSource = cmd.ExecuteReader();
                        libIncident.DataBind();

                        //Change Incident ID when selected index change
                        lblIncidentID.Text = libIncident.SelectedValue;
                        con.Close();
                    }
                }
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {

            string userID = ddCustomers.SelectedItem.Value;
            SqlDataSource1.DataBind();
            using (SqlConnection con = new SqlConnection(dbs))
            {
                using (SqlCommand command = new SqlCommand("Select UserId, Status, Description, ReportDate, IncidentID from [Incident] where UserID = " + userID, con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        con.Open();
                        DataTable tbl = new DataTable();
                        adapter.Fill(tbl);
                        lblCusID.Text = userID;
                        lblDate.Text = tbl.Rows[0]["ReportDate"].ToString();
                        lblIncidentID.Text = libIncident.SelectedItem.Value;
                        lblStatus.Text = tbl.Rows[0]["Status"].ToString();
                        txtDes.Text = tbl.Rows[0]["Description"].ToString();
                        con.Close();
                    }
                }
            }
        }
    }
}