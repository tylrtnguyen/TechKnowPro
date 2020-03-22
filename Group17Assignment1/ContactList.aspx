<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="Group17Assignment1.ContactList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>
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
    <form id="form1" runat="server">
     <div class="container">
        <h3>TechKnowPro - Incident Report Management Software</h3>
         <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
        <h4>Customer List - Manage your contact list</h4>
     </div>

     <div class="jumbotron">

         <asp:ListBox ID="ListBox1" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" >
            
             
         </asp:ListBox>

         <asp:Button CssClass="btn btn-outline-primary" ID="btnEmpty" runat="server" OnClick="btnEmpty_Click" Text="Empty List" />
         <asp:Button CssClass="btn btn-outline-primary" ID="btnRemove" runat="server" OnClick="btnRemove_Click" Text="Remove Contact" />
         <asp:Button CssClass="btn btn-outline-primary" ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Select Additional Contact" />

     </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
        <p>
    <asp:Label CssClass="text-danger" Font-Bold="true" Font-Size="Large" ID="lblError" runat="server"></asp:Label>
        </p>
        <hr />
        <p>
            <asp:Button ID="btnHome" OnClick="btnHome_Click" CssClass="btn btn-primary" runat="server" Text="Home" />
        </p>
    </form>
    </body>
</html>
