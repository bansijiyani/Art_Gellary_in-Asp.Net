<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="ArtGalleryApp.UserDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #a9fbf9;
        }

        .container {
            margin-top: 20px;
        }

        .product-card {
            margin-bottom: 20px;
        }

        .product-card img {
            max-width: 100%;
            height: auto;
        }

        .product-card h3 {
            font-size: 24px;
        }

        .product-card p {
            color: #555;
        }

        .product-card button {
            background-color: #17a2b8;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .product-card button:hover {
            background-color: #138496;
        }

        .btn-go-to-cart {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-go-to-cart:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-4 product-card">
                            <div class="card">
                                <img class="card-img-top" src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("ProductName") %>' />
                                <div class="card-body">
                                    <h3 class="card-title"><%# Eval("ProductName") %></h3>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <p class="card-text">Price: <%# Eval("Price") %></p>
                                    <asp:Button ID="btnAddToCart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("ArtworkID") %>' Text="Add to Cart" CssClass="btn btn-info" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <asp:Button ID="btnGoToCart" runat="server" Text="Go to Cart" OnClick="btnGoToCart_Click" CssClass="btn-go-to-cart" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
