<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TechnicianHome.aspx.cs" Inherits="Group17Assignment1.TechnicianHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Technician</title>
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
           <div class="container-fluid">
                    <a class="navbar-brand" href="AdminHome.aspx">TechKnowPro</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
               <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav navbar-right">
                        <li class="nav-item">
                            <a class="nav-link" href="/customers">Customers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contactlist">Contact List</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="/technician/viewincident">View Incident</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/technician/createincident">Create Incident</a>
                        </li>
                    </ul>
            </div>
          </div>
       </nav>
    <div class="container">
        <h3>TechKnowPro - Incident Report Management Software</h3>
        <form runat="server">
            <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
        <h4>Welcome to the TechKnow Pro Support Protal</h4>
        <h3>Getting Started</h3>
        <p>Go to <a href="technician/viewincident"> Incidents</a> to search and review client incident reports</p>
        </form>
     </div>
 
</body>
</html>
