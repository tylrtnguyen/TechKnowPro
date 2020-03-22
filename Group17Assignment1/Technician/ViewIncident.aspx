<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewIncident.aspx.cs" Inherits="Group17Assignment1.viewIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>
    <title>View Incident</title>
</head>
<body>
    <div class="container">
        <h1><b>TechKnowPro - Incident Report Management Software</b></h1>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="View Incident"></asp:Label>
            <br />
            Select a customer:
            <asp:DropDownList ID="ddCustomers" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FullName" DataValueField="userID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechKnowProConnection %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="select [User].userID, FirstName +', '+LastName as FullName from [User] 
            Join [Incident] on [User].userID = [Incident].UserID
            where FirstName is not null and LastName is not null ; "></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Incident List"></asp:Label>
        </div>
        <asp:ListBox ID="libIncident" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Rows="5" Width="1292px" AppendDataBoundItems="True" AutoPostBack="True"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TechKnowProConnection %>" SelectCommand="SELECT [IncidentID], [Title], [Status], [ReportDate] FROM [Incident]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnRetrieve" CssClass="btn btn-primary" runat="server" Text="Retrieve" Width="216px" OnClick="btnRetrieve_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" ForeColor="Black" runat="server" Text="Details"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" ForeColor="Black" runat="server" Text="Customer ID:  "></asp:Label>
        <asp:Label ID="lblCusID" ForeColor="Black" Font-Bold="true" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" ForeColor="Black" runat="server" Text="Report Date &amp; Time:  "></asp:Label>
        <asp:Label ID="lblDate" ForeColor="Black" Font-Bold="true" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" ForeColor="Black" runat="server" Text="Incident #: "></asp:Label>
        <asp:Label ID="lblIncidentID" ForeColor="Black" Font-Bold="true" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" ForeColor="Black" runat="server" Text="Status: "></asp:Label>
        <asp:Label ID="lblStatus" ForeColor="Black" Font-Bold="true" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label9" ForeColor="Black"  runat="server" Text="Description: "></asp:Label>
        <br />
        <asp:TextBox ID="txtDes" ForeColor="Black" Font-Bold="true" runat="server" Height="63px" Width="1292px"></asp:TextBox>
        <br />
    </form>
        <hr />
        <a href="/technician/home" class="btn btn-primary" style="text-align:center;">Home</a>
    </div>
    
</body>
</html>