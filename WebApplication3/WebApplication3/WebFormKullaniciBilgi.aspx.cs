using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class WebFormKullaniciBilgi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Eğer kullanıcı oturum açmamışsa, giriş sayfasına yönlendirilir
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("WebForm3.aspx");
            }
            else
            {
                // Kullanıcı oturum açmışsa, veritabanından kullanıcı bilgilerini al
                string userEmail = Session["UserEmail"].ToString();
                GetUserInformation(userEmail);
            }
        }

        private void GetUserInformation(string email)
        {
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT Ad, Soyad, Email, Universite FROM Uyeler WHERE Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            lblAd.Text = reader["Ad"].ToString();
                            lblSoyad.Text = reader["Soyad"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblUniversite.Text = reader["Universite"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Hata mesajı gösterebiliriz (bu sadece örnek)
                lblAd.Text = "Veri alınamadı. Hata: " + ex.Message;
            }
        }
        protected void btnGeriDon_Click(object sender, EventArgs e)
        {
            // WebForm4'e yönlendirme
            Response.Redirect("WebForm4.aspx");
        }
    }
}
