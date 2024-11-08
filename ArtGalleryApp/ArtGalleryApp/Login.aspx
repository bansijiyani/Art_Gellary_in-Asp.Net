<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtGalleryApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #a9fbf9;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.3);
            text-align: center;
            margin:auto;
            
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"],
        .login-container select {
            width: 100%;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #999;
            background: transparent;
            outline: none;
            height: 40px;
            color: #333;
            font-size: 16px;
        }

        .login-container input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
            background: #17a2b8;
            cursor: pointer;
            border-radius: 20px;
            width: 100%;
        }

        .login-container input[type="submit"]:hover {
            background: #138496;
        }

        .login-container a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
            line-height: 20px;
        }

        .login-container a:hover {
            color: #17a2b8;
        }

        .heading {
            text-align: center;
            color: black;
            font-size: 44px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="heading">Welcome to the Art Gallery App..!!</h1>
        <div class="login-container">
            <h2>Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblRole" runat="server" Text="Role:" CssClass="control-label"></asp:Label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                    <asp:ListItem Text="User" Value="user"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <br /><br />
            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
        </div>
    </form>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
