<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmSurvey.aspx.cs" Inherits="Group17Assignment1.Customer.ConfirmSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/Content/CustomCSS/favicon.png"/>
    <title>Survey Confirmation!</title>
    <style>
        .container{
            margin:10% 20%;
        }
        .form-row{
            margin-top:15px;
        }
    </style>
</head>
<body>
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
                </ul>
            </div>
          </div>
       </nav>
    <form id="form1" runat="server" class="form-horizontal">
        <div class="container">
             <h3>TechKnowPro - Incident Report Management Software</h3>
             <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
             <h4>Customer List - Manage your contact list</h4>
            <div class="card text-white bg-success mb-3" style="max-width: 50rem; top: 0px; left: 77px; width: 914px;">
              <div class="card-header">Survey Completed</div>
              <div class="card-body">
                <h4 class="card-title"><asp:Label ID="cusName" runat="server"></asp:Label>. We really appreciate your feed back!</h4>
                <p class="card-text">A customer representative will reach you within 24hrs.</p>
              </div>
            </div>
            <div class="form-row">
                        <div class="col-sm-12">
                            <asp:Button CssClass="btn btn-primary" ID="btnHome" OnClick="btnHome_Click" runat="server" Text="Home" Width="200px"/>
                           <asp:Button CssClass="btn btn-primary" ID="btnReturn" OnClick="btnReturn_Click" runat="server" Text="Return to survey" Width="188px"/>
                        </div>
             </div>
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
