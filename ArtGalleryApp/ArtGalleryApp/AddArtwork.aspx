<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="ArtGalleryApp.AddArtwork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Artwork</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f0f8ff;
        }

        .form-container {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-container .form-group {
            margin-bottom: 15px;
        }

        .form-container .btn-primary {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .form-container .btn-primary:hover {
            background-color: #138496;
            border-color: #117a8b;
        }

        .form-container .form-control {
            border-radius: 5px;
        }

        .form-container .form-control:focus {
            box-shadow: none;
            border-color: #17a2b8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <div class="row justify-content-left">
                <div class="col-md-6 form-container">
                    <h2>Add New Artwork</h2>
                    <div class="form-group">
                        <asp:Label ID="lblTitle" runat="server" Text="Title:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDescription" runat="server" Text="Description:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblArtist" runat="server" Text="Artist:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="txtArtist" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPrice" runat="server" Text="Price:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblImage" runat="server" Text="Upload Image:" CssClass="control-label"></asp:Label>
                        <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAdd" runat="server" Text="Add Artwork" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
