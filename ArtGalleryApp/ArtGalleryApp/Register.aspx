<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ArtGalleryApp.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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

        .register-container {
            width: 300px;
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.3);
            padding: 20px;
        }

        .register-container h2 {
            margin: 0;
            padding: 0 0 20px;
            color: #333;
        }

        .register-container input[type="text"],
        .register-container input[type="password"],
        .register-container select {
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

        .register-container input[type="submit"] {
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

        .register-container input[type="submit"]:hover {
            background: #138496;
        }

        #lblMessage {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Register</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <div>
                <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                    <asp:ListItem Text="User" Value="user"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            </div>
        </div>
    </form>
</body>
</html>
