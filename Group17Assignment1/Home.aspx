<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Group17Assignment1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tech Know Pro By Group 17</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Content/CustomCSS/master.css" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>

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
       <div id="home">
           <div class="landing-text">
               <h1>Welcome to</h1>
               <h2>TechKnowPro Customer Service Portal</h2>
               <a href="/login" class="btn btn-primary">Login</a>
               <a href="/customer/register" class="btn btn-primary">Register</a>
           </div>
       </div>
    
    
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/popper.min.js"></script>
</body>
</html>
