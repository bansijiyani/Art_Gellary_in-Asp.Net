<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtGalleryApp.Cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .btn-logout {
            margin-top: 20px;
            background-color: orangered;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-logout:hover {
            background-color: #e0a800;
        }

        .table img {
            max-width: 100px;
            height: auto;
        }

        .total-row {
            font-weight: bold;
        }
        body{
           background-color: #a9fbf9;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center my-4">Your Cart</h2>
            <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("ProductName") %>' /></td>
                        <td><%# Eval("ProductName") %></td>
                        <td><%# Eval("Description") %></td>
                        <td>Rs.<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label></td>
                        <td>
                            <asp:Button ID="btnRemoveFromCart" runat="server" CommandName="RemoveFromCart" CommandArgument='<%# Eval("CartID") %>' Text="Remove" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="row">
                <div class="col-12 text-right">
                    <h4 class="total-row">Total: Rs. <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-warning btn-logout" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
