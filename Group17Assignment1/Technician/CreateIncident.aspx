<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateIncident.aspx.cs" Inherits="Group17Assignment1.createIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Incident</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="~/Content/CustomCSS/master.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            height: 22px;
            width: 517px;
        }
        .auto-style4 {
            width: 517px;
        }
        .auto-style5 {
            margin-left: 30px;
        }
        .auto-style6 {
            margin-left: 57px;
        }
        .auto-style7 {
            margin-left: 134px;
        }
        .auto-style8 {
            margin-left: 164px;
        }
        .auto-style9 {
            margin-top: 0px;
        }
        .auto-style10 {
            margin-left: 82px;
        }
        .auto-style11 {
            width: 517px;
            height: 33px;
        }
        .auto-style12 {
            height: 33px;
        }
        .auto-style13 {
            margin-left: 0px;
        }
        
        .auto-style14 {
            -ms-flex-line-pack: start !important;
            align-content: flex-start !important;
            margin-top: 1px;
        }
        .button{
          
           
           align-items:center;
       }
        
        .auto-style16 {
            width: 1482px;
        }
        .container{
            margin:5% 20%;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
    <h1 class="auto-style16"><b>TechKnowPro - Incident Report Management Software</b></h1>
    <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" CausesValidation="false" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
        
        <p>
            <asp:Label ForeColor="Black" ID="lblPageTitle" runat="server" Text="Incident Report Page"></asp:Label>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblSelectCustomer" ForeColor="Black" runat="server" Text="Select a customer:"></asp:Label>
&nbsp;
                    <asp:DropDownList ID="ddlCus" runat="server" CssClass="auto-style5" DataSourceID="SqlDataSource1" DataTextField="fullName" DataValueField="userID" Width="144px" AutoPostBack="True" OnSelectedIndexChanged="ddlCus_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechKnowProConnection %>" SelectCommand="SELECT userID, LastName + ', ' + FirstName AS fullName FROM [User] WHERE LastName is not null and FirstName is not null"></asp:SqlDataSource>
                </td>
                <td class="auto-style2">
                    <asp:Label ForeColor="Black" ID="Label5" runat="server" Text="Report Date &amp; Time:"></asp:Label>
                    <asp:RequiredFieldValidator ID="ReportDateValidator" ControlToValidate="txtCurrTime" runat="server" CssClass="text-danger" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCurrTime" runat="server" AutoPostBack="True" CssClass="auto-style6" ReadOnly="True" Width="135px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ForeColor="Black" ID="Label4" runat="server" Text="CustomerID:"></asp:Label>
                    <asp:TextBox ID="txtCusID" runat="server" AutoPostBack="True" CssClass="auto-style10" ReadOnly="True" Width="139px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ForeColor="Black" ID="Label8" runat="server" Text="Incident #:"></asp:Label>
                    <asp:RequiredFieldValidator ID="IncidentIDValidator" ControlToValidate="txtIncidentID" runat="server" CssClass="text-danger" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtIncidentID" runat="server" AutoPostBack="True" CssClass="auto-style7" ReadOnly="True" Width="136px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <asp:Label ID="Label11" runat="server" ForeColor="Black" Text="Status:"></asp:Label>
                    <asp:RequiredFieldValidator ID="statusValidator" ControlToValidate="ddlStatus" runat="server" CssClass="text-danger" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="auto-style8" Width="144px" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="new">NEW</asp:ListItem>
                        <asp:ListItem Value="progress">IN PROGRESS</asp:ListItem>
                        <asp:ListItem Value="closed">CLOSED</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <p>
            <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Description of Problem:"></asp:Label>
            <asp:RequiredFieldValidator ID="desValidator" ControlToValidate="txtIncidentDes" runat="server" CssClass="text-danger" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </p>
        <p class="auto-style9">
            <asp:TextBox ID="txtIncidentDes" runat="server" Height="97px" OnTextChanged="txtIncidentDes_TextChanged" Rows="30" TextMode="MultiLine" Width="960px" CssClass="auto-style13"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label10" CssClass="lbl lblContactMethod" runat="server" ForeColor="Black" Text="Method of Contact: "></asp:Label>
            <asp:RadioButtonList CssClass="radioButtonList" ID="RadioButtonList1" runat="server"  CellPadding="2" CellSpacing="2" ForeColor="Black" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" ValidateRequestMode="Enabled" Width="80px" Height="16px">
                <asp:ListItem Text="Email" Value="Email">Email</asp:ListItem>
                <asp:ListItem Text="Phone" Value="Phone"></asp:ListItem>
                <asp:ListItem Text="In Person" Value="In Person"></asp:ListItem>
            </asp:RadioButtonList>
        </p>
            
        
        <p>
            &nbsp;</p>
        <p>
            </p>
            <div class="button">
            <asp:Button ID="Button1"  runat="server" Text="Submit" Width="279px" OnClick="Button1_Click" CssClass="btn btn-primary" />
            </div>
        <p>
            <asp:Label ID="lblInform" runat="server" Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:Label>
        </p>
            <asp:Label ID="errorMessage" runat="server" CssClass="text-danger"></asp:Label>
    </form>
    </div>
    
</body>
</html>
