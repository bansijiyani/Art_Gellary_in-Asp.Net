using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ArtGalleryApp
{
    public partial class Registration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            if (string.IsNullOrEmpty(role))
            {
                lblMessage.Text = "Please select a role.";
                return;
            }

            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ArtGalleryDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, @Role)", con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Role", role);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Registration failed.";
                }
            }
        }
    }
}
