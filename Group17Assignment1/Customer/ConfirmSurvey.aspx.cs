using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1.Customer
{
    public partial class ConfirmSurvey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cusName.Text = "Thank you, " + Session["FirstName"].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/login");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("/customer/home");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/customer/survey");
        }
    }
}