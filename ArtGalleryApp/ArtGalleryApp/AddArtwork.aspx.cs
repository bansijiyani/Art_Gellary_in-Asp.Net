using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.Configuration;

namespace ArtGalleryApp
{
    public partial class AddArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (fuImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                    string directoryPath = Server.MapPath("~/Images/");
                    string filePath = Path.Combine(directoryPath, fileName);

                    // Ensure the directory exists
                    if (!Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }

                    // Save the file
                    fuImage.SaveAs(filePath);

                    string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Artworks (Title, Description, Artist, Price, ImageUrl) VALUES (@Title, @Description, @Artist, @Price, @ImageUrl)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Artist", txtArtist.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                        cmd.Parameters.AddWithValue("@ImageUrl", "~/Images/" + fileName);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }

                    //lblMessage.Text = "Artwork added successfully!";
                    Response.Redirect("AdminDashboard.aspx");

                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Please upload an image.";
            }
        }
    }
}
