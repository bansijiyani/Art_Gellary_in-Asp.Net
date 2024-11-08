<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ArtGalleryApp.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #a9fbf9;
        }

        .dashboard-container {
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

        .dashboard-container h2, .dashboard-container h3 {
            color: #333;
        }

        .dashboard-container .btn-primary {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .dashboard-container .btn-primary:hover {
            background-color: #138496;
            border-color: #117a8b;
        }

        .dashboard-container .table {
            margin-top: 20px;
        }

        .dashboard-container .form-control {
            border-radius: 5px;
        }

        .dashboard-container .form-control:focus {
            box-shadow: none;
            border-color: #17a2b8;
        }
        .btn-logout {
    margin-top: 20px;
    background-color: #ffc107;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
}

.btn-logout:hover {
    background-color: #e0a800;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-left">
                <div class="col-md-10 dashboard-container">
                    <h2>Admin Dashboard</h2>
                    <h3>Artwork Management</h3>
                    <div class="form-group">
                        <asp:Label ID="lblSearch" runat="server" Text="Search:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block w-50"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary ml-2" OnClick="btnSearch_Click" />
                    </div>
                    <asp:GridView ID="gvArtworks" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" CssClass="table table-bordered table-striped" OnRowEditing="gvArtworks_RowEditing" OnRowDeleting="gvArtworks_RowDeleting" OnRowUpdating="gvArtworks_RowUpdating" OnRowCancelingEdit="gvArtworks_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="ArtworkID" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="Artist" HeaderText="Artist" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgArtwork" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100px" Height="100px" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtImageUrl" runat="server" Text='<%# Bind("ImageUrl") %>' CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnAddArtwork" runat="server" Text="Add New Artwork" CssClass="btn btn-primary mb-3" OnClick="btnAddArtwork_Click" />
                    <h3>User Management</h3>
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" CssClass="table table-bordered table-striped" OnRowEditing="gvUsers_RowEditing" OnRowDeleting="gvUsers_RowDeleting" OnRowUpdating="gvUsers_RowUpdating" OnRowCancelingEdit="gvUsers_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Role" HeaderText="Role" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row">
    <div class="col-12 text-center">
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-warning btn-logout" />
    </div>
</div>
    </form>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
