<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="Group17Assignment1.Members" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Our group's members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="Content/CustomCSS/favicon.png"/>
    <style>
        .table{
            color:#000000;
            text-align:center;
            font-size:18px;
        }
        .container{
            margin:10% 20%;
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
                    
                </ul>
            </div>
          </div>
       </nav>
    <div class="container">
        <h2>Our group's members:</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Student ID</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Thanh</td>
                    <td>Quan</td>
                    <td>101142560</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Thong</td>
                    <td>Nguyen</td>
                    <td>101140366</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Vo Anh Tu</td>
                    <td>Nguyen</td>
                    <td>101148412</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>Quang</td>
                    <td>Pham</td>
                    <td>101136246</td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>Aregawi</td>
                    <td>Gebremicaea</td>
                    <td>101171795</td>
                </tr>
          </tbody>
    </table>
   </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
