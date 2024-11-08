using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ArtGalleryApp
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindArtworks();
                BindUsers();
            }
        }

        private void BindArtworks()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Artworks";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvArtworks.DataSource = dt;
                gvArtworks.DataBind();
            }
        }

        private void BindUsers()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Users";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Artworks WHERE Title LIKE @Search";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text + "%");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvArtworks.DataSource = dt;
                gvArtworks.DataBind();
            }
        }

        protected void btnAddArtwork_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddArtwork.aspx");
        }

        protected void gvArtworks_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvArtworks.EditIndex = e.NewEditIndex;
            BindArtworks();
        }

        protected void gvArtworks_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvArtworks.EditIndex = -1;
            BindArtworks();
        }

        protected void gvArtworks_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvArtworks.Rows[e.RowIndex];
            int artworkID = Convert.ToInt32(gvArtworks.DataKeys[e.RowIndex].Values[0]);

            string title = (row.Cells[1].Controls[0] as TextBox)?.Text;
            string description = (row.Cells[2].Controls[0] as TextBox)?.Text;
            string artist = (row.Cells[3].Controls[0] as TextBox)?.Text;
            decimal price = 0;
            if (decimal.TryParse((row.Cells[4].Controls[0] as TextBox)?.Text, out decimal parsedPrice))
            {
                price = parsedPrice;
            }
            string imageUrl = (row.Cells[5].Controls[0] as TextBox)?.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Artworks SET Title=@Title, Description=@Description, Artist=@Artist, Price=@Price, ImageUrl=@ImageUrl WHERE ArtworkID=@ArtworkID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Description", description ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Artist", artist ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@ArtworkID", artworkID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            gvArtworks.EditIndex = -1;
            BindArtworks();
        }

        protected void gvArtworks_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            try
            {
                int artworkID = Convert.ToInt32(gvArtworks.DataKeys[e.RowIndex].Values[0]);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Delete related records in the Cart table
                    string deleteCartQuery = "DELETE FROM Cart WHERE ArtworkID=@ArtworkID";
                    SqlCommand deleteCartCmd = new SqlCommand(deleteCartQuery, conn);
                    deleteCartCmd.Parameters.AddWithValue("@ArtworkID", artworkID);
                    deleteCartCmd.ExecuteNonQuery();

                    // Delete the artwork
                    string deleteArtworkQuery = "DELETE FROM Artworks WHERE ArtworkID=@ArtworkID";
                    SqlCommand deleteArtworkCmd = new SqlCommand(deleteArtworkQuery, conn);
                    deleteArtworkCmd.Parameters.AddWithValue("@ArtworkID", artworkID);
                    deleteArtworkCmd.ExecuteNonQuery();

                    conn.Close();
                }

                BindArtworks();
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message
                // For example: lblError.Text = "An error occurred: " + ex.Message;
                throw new Exception("An error occurred while deleting the artwork: " + ex.Message);
            }
        }

        protected void gvUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            BindUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            BindUsers();
        }

        protected void gvUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvUsers.Rows[e.RowIndex];
            int userID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Values[0]);
            string username = (row.Cells[1].Controls[0] as TextBox)?.Text;
            string role = (row.Cells[2].Controls[0] as TextBox)?.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET Username=@Username, Role=@Role WHERE UserId=@UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Role", role ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@UserId", userID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            gvUsers.EditIndex = -1;
            BindUsers();
        }

        protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            try
            {
                int userID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Values[0]);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Delete the user
                    string deleteUserQuery = "DELETE FROM Users WHERE UserId=@UserId";
                    SqlCommand deleteUserCmd = new SqlCommand(deleteUserQuery, conn);
                    deleteUserCmd.Parameters.AddWithValue("@UserId", userID);
                    deleteUserCmd.ExecuteNonQuery();

                    conn.Close();
                }

                BindUsers();
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message
                // For example: lblError.Text = "An error occurred: " + ex.Message;
                throw new Exception("An error occurred while deleting the user: " + ex.Message);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session and redirect to the login page
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
