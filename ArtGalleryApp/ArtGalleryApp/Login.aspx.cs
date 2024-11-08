using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace ArtGalleryApp
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ddlRole.SelectedValue == "")
            {
                lblMessage.Text = "Please select a role.";
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, Role FROM Users WHERE Username=@Username AND Password=@Password AND Role=@Role";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    int userId = Convert.ToInt32(reader["UserID"]);
                    string role = reader["Role"].ToString();
                    Session["UserID"] = userId; // Set the session variable for UserID
                    Session["Username"] = txtUsername.Text; // Set the session variable for Username
                    if (role == "admin")
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("UserDashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid username, password, or role.";
                }
            }
        }
    }
}
