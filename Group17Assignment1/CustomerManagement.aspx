<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerManagement.aspx.cs" Inherits="Group17Assignment1.CustomerManagement" %>

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
                    <li class="nav-item">
                        
                    </li>
                </ul>
            </div>
          </div>
       </nav>
    <div class="container">
        <form id="form1" runat="server" class="form-horizontal">
        <h3>TechKnowPro - Incident Report Management Software</h3>
        <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
        <h4>Customer - Search and view your customer information</h4>
            <div class="row">
                <div class="col-sm-8">
                    <div class="form-row">
                        <div class="col-sm-12"><asp:Label ID="lblWelcome" runat="server" CssClass="text-capitalize text-info"></asp:Label></div></div>
                    <div class="form-row">
                        <label class="col-sm-5 col-form-label-lg">Select a customer:</label>
                        <div class="col-sm-5">
                            <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="UserFullName" 
                                DataValueField="UserID"
                                  CssClass="form-control" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged">
                            </asp:DropDownList>
                           <%-- < Query to get data from User database except for admin and technician %>--%>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString='<%$ ConnectionStrings:TechKnowProConnection %>' 
                                SelectCommand="SELECT [UserID], [Email], [Address], [LastName], 
                                [FirstName], FirstName+', '+LastName AS [UserFullName] 
                                FROM [User]
                                WHERE [Email] != 'admin@isp.net'
                                AND [Email] != 'tech@isp.net'
                                ORDER BY [UserID]">
                            </asp:SqlDataSource>
                        </div>
                    </div>   
                    <div class="form-row">
                        <div class="col-sm-2 col-form-label"><h5><asp:Label ID="lblAddress" runat="server">Address:</asp:Label></h5></div>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control form-control-lg" ID="txtAddress" ReadOnly="True"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-2 col-form-label"><h5><asp:Label ID="lblEmail" runat="server">Email:</asp:Label></h5></div>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="txtEmail" ReadOnly="True"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-2 col-form-label"><h5><asp:Label ID="lblPhone" runat="server">Phone:</asp:Label></h5></div>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="txtPhone" ReadOnly="True"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <asp:Button CssClass="btn btn-primary" ID="btnAdd" runat="server" Text="Add to Contact List" 
                                onclick="btnAdd_Click" Width="279px" />
                            <asp:Button CssClass="btn btn-primary" ID="btnDisplay" runat="server" Text="Display Contact List" 
                                PostBackUrl="~/ContactList.aspx" CausesValidation="False" Width="279px" OnClick="btnDisplay_Click" />
                        </div>
                    </div>
                    <asp:Button CssClass="btn btn-primary" ID="btnHome" runat="server" Text="Home" 
                                CausesValidation="False" Width="265px" OnClick="btnHome_Click" />
                    <hr />
                    </div>
                </div>
	</form>
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
