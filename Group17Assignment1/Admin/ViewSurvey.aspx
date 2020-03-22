<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="Group17Assignment1.Admin.ViewSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Survey</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/Content/CustomCSS/favicon.png"/>
    <style>
        .container{
            margin:2% 20%;
        }
        .lbl{
            margin-right:10px;
        }
         #ddlSelectCustomer, #ResponseTime, #TechEfficiency{
             margin-right:200px;
         }
         .button{
           display:flex;
           justify-content:flex-end;
           align-items:center;
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
        <form id="form1" runat="server">
         <h2>TechKnow Pro - Incident Report Management Software</h2>
          <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
         <h4>View Survey</h4>
        <div class="form-group">
            <asp:Label CssClass="lbl lblSelectCustomer" ID="lblSelectCustomer" runat="server" Font-Bold="true" 
                        Font-Size="Medium" ForeColor="Black" Text="Select a customer: ">
            </asp:Label>
            <asp:DropDownList ID="ddlSelectCustomer" runat="server" DataSourceID="SqlDataSource1" 
                              AutoPostBack="True" OnSelectedIndexChanged="ddlSelectCustomer_SelectedIndexChanged"
                              DataTextField="combind" DataValueField="UserID" Height="21px" Width="150px"> 
            </asp:DropDownList>
            <asp:Label CssClass="lbl lblCustomerID" ID="lblCustomerID" Font-Bold="true" Font-Size="Medium" ForeColor="Black" runat="server" Text="Customer ID: "></asp:Label>
            <asp:TextBox runat="server" ReadOnly="true" ID="customerID"></asp:TextBox>
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechKnowProConnection %>" SelectCommand="SELECT (FirstName + ', ' + LastName) as combind, [userID] FROM [User]  WHERE [Email] != 'admin@isp.net'
                                AND [Email] != 'tech@isp.net'"></asp:SqlDataSource>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Survey Listing: " ForeColor="Black"></asp:Label>
                </p>
                <asp:ListBox ID="ListBox1" runat="server" Rows="5"  Width="700px" ></asp:ListBox>
                <p>
                    <asp:Button runat="server" Text="Retrieve Survey Detail" ID="btnRetrieve" OnClick="btnRetrieve_Click"/>
                </p>
                <p>
                    <asp:Label ID="lblRating" runat="server" Text="Customer Rating" ForeColor="Black" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="lblResponseTime" runat="server" Text="Response Time: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="ResponseTime" runat="server" ForeColor="Black" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    <asp:Label ID="lblContactBack" runat="server" Text="Contact to discuss: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="ContactBack" runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="lblTechEfficiency" runat="server" Text="Tech Efficiency: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="TechEfficiency" runat="server" ForeColor="Black" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    <asp:Label ID="lblContactMethod" runat="server" Text="Prefered Contact Method: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="ContactMethod" runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="lblProbResolution" runat="server" Text="Problem Resolution: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="ProbResolution" runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </p>
                <p class="customerComment">
                    <asp:Label CssClass="lbl lblComment" ID="lblComment" runat="server" Text="Additional Comments:" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="txtAreaComment" runat="server" Columns="60" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </p>
            <hr />
             <a href="/admin/home" class="btn btn-primary" style="text-align:center;">Home</a>  
    </form>
    </div>
    
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
