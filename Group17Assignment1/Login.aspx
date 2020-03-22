<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Group17Assignment1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>
    <style>
        .container{
            margin: 10% 20%;
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
                            <a class="nav-link" href="/members">Members</a>
                        </li>
                    </ul>
               </div>
          </div>
       </nav>
       <div class="alert alert-dismissible alert-warning" id ="DivAlert" runat="server">
            <h4 class="auto-style1"><strong>Congratuation</strong>!</h4>
            <p class="auto-style2">You have successfully created your account to our service. Please check your email for your verification code. ------&gt; 
                    <asp:HyperLink ID="VerifyEmail" runat="server" ForeColor="Red" NavigateUrl="https://mail.google.com/mail/">Customer Email</asp:HyperLink>
            </p>
        </div>
    <div class="container">
       <h1>LOGIN</h1>
       <asp:Label ID="Error" runat="server" CssClass="text-danger" Font-Bold="true" Font-Size="Large"></asp:Label>
       <form id="form1" runat="server">
              <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Email Address"></asp:Label>
                    <asp:TextBox ID="Email" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
              </div>
              <div class="form-group">
                    <label for="Password">Password</label>
                    <asp:TextBox ID="Password"  CssClass="form-control" placeholder="Password" runat="server" type="Password"></asp:TextBox>
              </div>
                    <asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click1" />
                    <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" OnClick="btnRegister_Click" Text="Register" />
               <div class="form-group">
                    <asp:LinkButton ID="LinkButton1" href="#" runat="server">Forgot your password?</asp:LinkButton>
               </div>
         </form>
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
