<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="Group17Assignment1.CustomerHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
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
                    <a class="navbar-brand" href="CustomerHome.aspx">TechKnowPro</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
               <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav navbar-right">                   
                    <li class="nav-item">
                        <a class="nav-link" href="/members">Members</a>
                    </li>
                </ul>
                   <div style="float:right;">
                       <asp:Label runat="server" ID="lblUserName"></asp:Label>
                   </div>
                   
            </div>
          </div>
       </nav>
    <div class="jumbotron">
        <div class="container">
            <h1 class='display-5'>TechKnowPro - Incident Report Management Software</h1>
            <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
            <h4>Welcome to the TechKnow Pro Support Protal</h4>
             <hr />
        <h3>Getting Started</h3>
        <p>Go to <a href="/customer/profile"> Your Profile Page</a> to update you profile and/or customer information</p>
         <hr />
        <h3>What do you think about our service?</h3>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Label"><a href="/customer/survey">Submit a survey</a> to provide your feedback for any support we have provided to you recently </asp:Label>
        </div>
        </div>
     </div>
 
    </form>
 
</body>
</html>
