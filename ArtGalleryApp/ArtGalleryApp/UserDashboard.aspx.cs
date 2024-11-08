using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryApp
{
    public partial class UserDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LoadArtworks();
                }
            }
        }

        private void LoadArtworks()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ArtworkID, Title AS ProductName, Price, Description, ImageUrl FROM Artworks"; // Include ImageUrl
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptProducts.DataSource = reader;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string artworkId = e.CommandArgument.ToString();
                int userId = Convert.ToInt32(Session["UserID"]);

                string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Cart (UserID, ArtworkID, Quantity) VALUES (@UserID, @ArtworkID, 1)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@ArtworkID", artworkId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Show success message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert('Item successfully added to cart.');", true);
            }
        }

        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}
