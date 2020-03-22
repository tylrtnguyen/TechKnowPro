<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Group17Assignment1.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/Content/CustomCSS/favicon.png"/>
<style>
       body .form-row{
           margin: 15px;
           padding: 10px;
       }
       body h3,h4{
           margin: 15px;
           padding: 10px;
           font-weight:700;
       }
       .button{
           display:flex;
           justify-content:flex-end;
           align-items:center;
       }
       .col-sm-12{
           margin: 15px;
           padding: 10px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
           <div class="container-fluid">
                    <a class="navbar-brand" href="/admin/home">TechKnowPro</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
               <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav navbar-right">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/members">Members</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contactlist">Contact List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/viewsurvey">View Surveys</a>
                    </li>
                </ul>
            </div>
          </div>
       </nav>
    <div class="container">
        <h3>TechKnowPro - Incident Report Management Software</h3>
        <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
        <h4>Welcome to the TechKnow Pro Support Protal</h4>
        <h3>Getting Started</h3>
        <p>Go to <a href="/customers"> Customer</a> section to search customer information</p>
     </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </form>
</body>
</html>
