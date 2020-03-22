using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group17Assignment1
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Convert.ToBoolean(Session["check"]) != true || Convert.ToInt32(Session["author"]) != 1 )
            {
                Response.Redirect("/login");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("~/Login.aspx");
        }
    }
}