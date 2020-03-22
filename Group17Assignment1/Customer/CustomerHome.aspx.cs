using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1
{
    public partial class CustomerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 3)
            {
              Response.Redirect("~/Login.aspx");
            }
            lblUserName.Text = "Welcome to MyApp, " + Session["FirstName"].ToString(); 
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("~/Login.aspx");
        }
    }
}