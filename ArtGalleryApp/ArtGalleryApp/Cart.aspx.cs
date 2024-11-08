using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryApp
{
    public partial class Cart : Page
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
                    LoadCartItems();
                }
            }
        }

        private void LoadCartItems()
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.CartID, a.ArtworkID, a.Title AS ProductName, a.Price, a.Description, a.ImageUrl
                    FROM Cart c
                    JOIN Artworks a ON c.ArtworkID = a.ArtworkID
                    WHERE c.UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptCartItems.DataSource = reader;
                rptCartItems.DataBind();
            }

            // Calculate total price
            CalculateTotal();
        }

        private void CalculateTotal()
        {
            decimal total = 0;
            foreach (RepeaterItem item in rptCartItems.Items)
            {
                Label lblPrice = (Label)item.FindControl("lblPrice");
                if (lblPrice != null)
                {
                    string priceText = lblPrice.Text.Replace("$", "").Replace(",", "").Trim();
                    total += Convert.ToDecimal(priceText);
                }
            }
            lblTotal.Text = total.ToString("C");
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveFromCart")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Cart WHERE CartID = @CartID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CartID", cartId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Reload the cart items to reflect the removal
                LoadCartItems();
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
