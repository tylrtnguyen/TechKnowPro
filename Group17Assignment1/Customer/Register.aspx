<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Group17Assignment1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/Content/CustomCSS/favicon.png"/>
    <style>
        .container{
            margin:2% 20%;
        }
        h1{
            margin:2% 20%;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
           <div class="container-fluid">
                    <a class="navbar-brand" href="Home">TechKnowPro</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
               <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav navbar-right">                   
                    <li class="nav-item">
                        <a class="nav-link" href="Members">Members</a>
                    </li>
                </ul>
            </div>
          </div>
       </nav>
    <h1>REGISTRATION PAGE</h1>
   
    <div class="container">
        <!-- Page Title -->
            
        <!-- Form begins -->
          <form runat="server">
          <asp:ValidationSummary CssClass="text-danger" Font-Bold="true" ID="ValidationSummary1" runat="server" style="margin-left: 0px" />
          <div class="form-row">
             <div class="form-group col-md-6">
                  <label for="FirstName">First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="FirstName" ErrorMessage="Alphabet Character Only" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                  </label>&nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="FirstName" placeholder="First Name" AutoCompleteType="Disabled" ></asp:TextBox>
             </div>
             <div class="form-group col-md-6">
                  <label for="LastName">Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastName" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="LastName" ErrorMessage="Alphabet Character Only" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                  </label>&nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="LastName" placeholder="Last Name" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
            </div>
            <div class="form-group">               
                <label for="Address">Address</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Address" ForeColor="Red">*</asp:RequiredFieldValidator>
                
            &nbsp;<asp:TextBox runat="server" type="text" class="form-control" ID="Address" placeholder="Address" AutoCompleteType="Disabled"></asp:TextBox>
                
            </div>
            <div class="form-group">
                <label for="EmailAddress">Email</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Email" ForeColor="Red">*</asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Email" ErrorMessage="Please enter the right format of an email" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:CustomValidator Display="Dynamic" ID="UsernameChecker" runat="server" ControlToValidate="Email"  ErrorMessage="Username already exist" ForeColor="Red" OnServerValidate="UsernameChecker_ServerValidate"></asp:CustomValidator>
            &nbsp;&nbsp;<asp:TextBox runat="server" type="email" class="form-control" ID="Email" placeholder="Email Address" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Password">Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Password" ErrorMessage="Password Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "Password" ID="RegularExpressionValidator3" ValidationExpression = "((?=.*[A-Z])(?=.*[\W]).{6,12})" runat="server" ErrorMessage="The password must be 6-12 characters in length,contain at least 1 uppercase letter,contain at least 1 special character" ForeColor="Red"></asp:RegularExpressionValidator>
                </label>&nbsp;<asp:TextBox runat="server" type="password" class="form-control" ID="Password" placeholder="Password"></asp:TextBox>
            </div>
              <div class="form-group">
                <label for="ConfirmPassword">Confirm Password</label>
                <asp:TextBox runat="server" type="password" class="form-control" ID="ConfirmPassword" placeholder="Confirm Password"></asp:TextBox>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
            </div>
              <div class="form-group">
                <label for="Question">Question </label>&nbsp;<asp:DropDownList ID="Question" runat="server" DataTextField="QuestionContent" DataValueField="QuestionID"></asp:DropDownList>
            </div>
              <div class="form-group">
                <label for="Answer">Answer </label>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Answer" ErrorMessage="Please answer your question" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:TextBox runat="server" class="form-control" ID="Answer" placeholder="Answer" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
           <div class="form-group row">
              <div class="col-sm-10">
                <div class="form-check">
                    <asp:CheckBox runat="server" ID="AgreetoTerms" class="form-check-input" type="checkbox"/>
                    <label class="form-check-label" for="gridCheck1">
                    I agree to <a href="#">terms of service</a>
                    </label>
                </div>
                  <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please Agree to the Terms of Service" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
              </div>
           </div>
          <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="btnRegister_Click" />
          <asp:Button ID="btnCancel" CssClass="btn btn-primary" runat="server" Text="Return" OnClick="btnCancel_Click" CausesValidation="False"/>
        </form>
    <!-- Form ends -->
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
