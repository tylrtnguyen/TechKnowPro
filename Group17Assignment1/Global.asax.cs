using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace Group17Assignment1
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        protected void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "Home-Route",
                "home",
                "~/Home.aspx"
            );
            routes.MapPageRoute(
                "Login-Route",
                "login",
                "~/Login.aspx"
            );
            routes.MapPageRoute(
                "CustomerHome-Route",
                "customer/home",
                "~/Customer/CustomerHome.aspx"
            );
            routes.MapPageRoute(
                "Register-Route",
                "customer/register",
                "~/Customer/Register.aspx"
            );
            routes.MapPageRoute(
                "Members-Route",
                "members",
                "~/Members.aspx"
            );
            routes.MapPageRoute(
                "AdminHome-Route",
                "admin/home",
                "~/Admin/AdminHome.aspx"
            );
            routes.MapPageRoute(
                "ContactList-Route",
                "contactlist",
                "~/ContactList.aspx"
            );
            routes.MapPageRoute(
                "SubmitSurvey-Route",
                "customer/survey",
                "~/Customer/CustomerSurvey.aspx"
            );
            routes.MapPageRoute(
                "ViewSurvey-Route",
                "admin/viewsurvey",
                "~/Admin/ViewSurvey.aspx"
            );
            routes.MapPageRoute(
                "SurveyCompleted-Route",
                "customer/surveycompleted",
                "~/Customer/SurveyCompleted.aspx"
            );
            routes.MapPageRoute(
               "CustomerProfile-Route",
               "customer/profile",
               "~/Customer/Profile.aspx"
           );
            routes.MapPageRoute(
               "CustomerManagement-Route",
               "customers",
               "~/CustomerManagement.aspx"
           );
            routes.MapPageRoute(
               "TechnicianHome-Route",
               "technician/home",
               "~/Technician/TechnicianHome.aspx"
           );
            routes.MapPageRoute(
               "ViewIncident-Route",
               "technician/viewincident",
               "~/Technician/ViewIncident.aspx"
           );
            routes.MapPageRoute(
               "CreateIncident-Route",
               "technician/createincident",
               "~/Technician/CreateIncident.aspx"
           );
            routes.MapPageRoute(
               "SurveyConfirm-Route",
               "customer/surveyconfirm",
               "~/Customer/ConfirmSurvey.aspx"
           );
        }
    }
}