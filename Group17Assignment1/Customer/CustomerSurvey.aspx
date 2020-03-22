<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="Group17Assignment1.CustomerSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Surveys</title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="~/Content/CustomCSS/master.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/Content/CustomCSS/favicon.png"/>
    <style>
        .container{
            margin:5% 20%;
        }
    </style>
</head>
<body>
    <form class="form-inline" id="form1" runat="server">   
        <div class="container">
            <%-- Begin Page Title and Logout button Section--%>
                <h3><asp:Label ID="lblAppName" runat="server" Text="">TechKnowPro - Incident Report Management Software</asp:Label>
                <asp:Button CssClass="btn btn-outline-primary" ID="btnLogout" runat="server" style="margin-left: 1131px; margin-top: 0px;" CausesValidation="false" Text="Logout" Width="138px" OnClick="btnLogout_Click" />
                </h3>
                <h5><asp:Label ID="lblPageName" runat="server" Text="">Surveys - Collect feedback from customers</asp:Label></h5>
            <%-- End Section --%>
            <%-- Survey Section --%>
            <div class="form-control">
                 <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID" ForeColor="Black"></asp:Label>
                 <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" style="margin-left: 60px"></asp:TextBox>
            </div>
            <br />
        <div class="form-control">
            <p>
                 <asp:ListBox ID="ListBoxIncident" runat="server">
                </asp:ListBox>
            </p>
            <asp:Label CssClass="text-danger" ID="listSelectValidate" runat="server"></asp:Label>
        </div>
            <%-- Begin ResponseTime Section --%>
        <div class="form-control">
            
            <asp:Label ID="lblResponseTime" CssClass="lbl lblResponseTime" runat="server" Text="Response Time:" ForeColor="Black"></asp:Label>
            <asp:RadioButtonList CssClass="radioButtonList" ID="RspTimeList" runat="server" CellPadding="2" CellSpacing="2" ForeColor="Black" Height="10px" RepeatDirection="Horizontal">
                 <asp:ListItem Text="Not Satisfied" Value="Not Satisfied"></asp:ListItem>
                 <asp:ListItem Text="Somewhat Satisfied" Value="Somewhat Satisfied"></asp:ListItem>
                 <asp:ListItem Text="Satisfied" Value="Satisfied"></asp:ListItem>
                 <asp:ListItem Text="Completely Satisfied" Value="Completely Satisfied"></asp:ListItem>
            </asp:RadioButtonList> 
            <asp:RequiredFieldValidator CssClass="text-danger" ID="RspTimeValidate" runat="server" ControlToValidate="RspTimeList" Display="Dynamic" ErrorMessage="How fast did we response to you?"></asp:RequiredFieldValidator>
        </div>    
            <%-- End ReponseTime Section --%>
            <div class="form-control">
                    <asp:Label CssClass="lbl lblTechEfficiency" ID="lblTechEfficiency" runat="server" Text="Tech Efficiency:" ForeColor="Black"></asp:Label>
                    <asp:RadioButtonList CssClass="radioButtonList" ID="TechEffList" runat="server" CellPadding="2" CellSpacing="2" ForeColor="Black" Height="10px" RepeatDirection="Horizontal">
                         <asp:ListItem Text="Not Satisfied" Value="Not Satisfied"></asp:ListItem>
                         <asp:ListItem Text="Somewhat Satisfied" Value="Somewhat Satisfied"></asp:ListItem>
                         <asp:ListItem Text="Satisfied" Value="Satisfied"></asp:ListItem>
                         <asp:ListItem Text="Completely Satisfied" Value="Completely Satisfied"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="TechEffValidate" runat="server" Display="Dynamic" ControlToValidate="TechEffList" ErrorMessage="Are you satisfied with our tech skills?"></asp:RequiredFieldValidator>
            </div>
            <div class="form-control">
                <asp:Label CssClass="lbl lblProbResolution" ID="Label1" runat="server" Text="Problem Resolution:" ForeColor="Black"></asp:Label>
                <asp:RadioButtonList CssClass="radioButtonList" ID="ProbResolutionList" runat="server" CellPadding="2" CellSpacing="2" ForeColor="Black" Height="10px" RepeatDirection="Horizontal">
                     <asp:ListItem Text="Not Satisfied" Value="Not Satisfied"></asp:ListItem>
                     <asp:ListItem Text="Somewhat Satisfied" Value="Somewhat Satisfied"></asp:ListItem>
                     <asp:ListItem Text="Satisfied" Value="Satisfied"></asp:ListItem>
                     <asp:ListItem Text="Completely Satisfied" Value="Completely Satisfied"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="ProbResolutionValidate" runat="server" ControlToValidate="ProbResolutionList" Display="Dynamic" ErrorMessage="How is our Problem Resolution Skills?"></asp:RequiredFieldValidator>
            </div>
            
        <p class="customerComment">
                <asp:Label CssClass="lbl lblComment" ID="lblComment" runat="server" Text="Additional Comments:" ForeColor="Black"></asp:Label>
                <asp:TextBox ID="txtAreaComment" runat="server" Columns="60" Rows="5" TextMode="MultiLine"></asp:TextBox>
        </p>
                <asp:CheckBox ID="contactMethod" runat="server" />
                <asp:Label ID="lblContactMethod" runat="server" Text="Please contact me to discuss this incident" ForeColor="Black"></asp:Label>
            <p>
            <asp:RadioButtonList CssClass="radioButtonList" ID="contactMethodList" runat="server" CellPadding="2" CellSpacing="2" ForeColor="Black" Height="10px" RepeatDirection="Horizontal">
                <asp:ListItem Text="Contact via Email" Value="Email"></asp:ListItem>
                <asp:ListItem Text="Contact via Phone" Value="Phone"></asp:ListItem>
            </asp:RadioButtonList>
                
        </p>
                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" runat="server" Text="Submit" />
        </div>
    </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
