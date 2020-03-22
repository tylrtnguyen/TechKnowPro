<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Group17Assignment1.Profile" %>

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
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
           <div class="container-fluid">
                    <a class="navbar-brand" href="CustomerHome.aspx">TechKnowPro</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
               <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav navbar-right">                   
                    <li class="nav-item">
                        <a class="nav-link" href="/Members">Members</a>
                    </li>
                    <li class="nav-item">
                        
                    </li>
                </ul>
            </div>
          </div>
       </nav>
    

    <div class="container">
        <!-- Page Title -->
            
        <!-- Form begins -->
          <form runat="server">
               <div class="container">
        <h3>TechKnowPro - Incident Report Management Software</h3>
        <asp:Button CssClass="btn btn-outline-primary" ID="Button1" runat="server" style="margin-left: 1131px; margin-top: 0px;" Text="Logout" CausesValidation="false" Width="138px" OnClick="btnLogout_Click" />
        <h4>Customer - Search and view your customer information</h4>
        </div>
          <asp:ValidationSummary CssClass="text-danger" Font-Bold="true" ID="ValidationSummary1" runat="server" style="margin-left: 0px" />
          <div class="form-row">
             <div class="form-group col-md-6">
                  <label for="FirstName">First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                  </label>&nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="txtFirstName" placeholder="First Name" AutoCompleteType="Disabled" ></asp:TextBox>
             </div>
             <div class="form-group col-md-6">
                  <label for="LastName">Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ForeColor="Red">*</asp:RequiredFieldValidator>
                  </label>&nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="txtLastName" placeholder="Last Name" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
            </div>
            <div class="form-group">               
                <label for="Address">Address</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ForeColor="Red">*</asp:RequiredFieldValidator>
                
            &nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="txtAddress" placeholder="Address" AutoCompleteType="Disabled"></asp:TextBox>
                
            </div>
            <div class="form-group">
                <label for="EmailAddress">Email</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ForeColor="Red">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;<asp:TextBox runat="server" type="email" class="form-control" ID="txtEmail" placeholder="Email Address" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Password">Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </label>&nbsp;<asp:TextBox runat="server" type="password" class="form-control" ID="txtPassword" placeholder="Password"></asp:TextBox>
            </div>
              <div class="form-group">
                <label for="ConfirmPassword">Confirm Password</label>
                <asp:TextBox runat="server" type="password" class="form-control" ID="txtConfirmPassword" placeholder="Confirm Password"></asp:TextBox>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
            </div>
              <div class="form-group">
                <label for="Question">Question </label>&nbsp;
                  <asp:DropDownList DataSourceID="SqlDataSource1" ID="ddlQuestion" runat="server" DataTextField="QuestionContent" 
                      DataValueField="QuestionID">
                  </asp:DropDownList>
                  <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                      ConnectionString='<%$ ConnectionStrings:TechKnowProConnection %>'
                      SelectCommand='SELECT [QuestionID], [QuestionContent] FROM [SecurityQuestion] ORDER BY [QuestionContent]'>
                  </asp:SqlDataSource>
            </div>
              <div class="form-group">
                <label for="Answer">Answer </label>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAnswer" ErrorMessage="Please answer your question" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:TextBox runat="server" class="form-control" ID="txtAnswer" placeholder="Answer" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
           <div class="form-group row">
              <div class="col-sm-10">
              </div>
           </div>
          <asp:Button ID="Update" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
          <asp:Button ID="Return" CssClass="btn btn-primary" runat="server" Text="Return" OnClick="btnReturn_Click" CausesValidation="False"/>
        </form>
    <!-- Form ends -->
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
