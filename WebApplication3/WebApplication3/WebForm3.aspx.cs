using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
        // Giriş Yapma Butonunun Tıklanması
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string email = txtEmailGiris.Value;
            string sifre = txtSifreGiris.Value;
            sifre = ComputeSha256Hash(sifre); // Girilen şifre hashleniyor
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Uyeler WHERE Email = @Email AND Sifre = @Sifre";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Sifre", sifre);

                        int userCount = (int)cmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            // Kullanıcı giriş yaptı, oturum aç
                            Session["UserEmail"] = email;
                            Response.Redirect("WebForm4.aspx"); // Kullanıcıyı bilgi sayfasına yönlendir
                        }
                        else
                        {
                            lblMessage.Text = "Geçersiz e-posta veya şifre.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Hata: " + ex.Message;
            }
        }


        // Kayıt Olma Butonunun Tıklanması
        protected void btnKaydol_Click(object sender, EventArgs e)
        {
            string ad = txtAd.Value;
            string soyad = txtSoyad.Value;
            string email = txtEmailKaydol.Value;
            string sifre = txtSifreKaydol.Value;
            string universite = txtUniversite.Value;
            string hashedPassword = ComputeSha256Hash(sifre); // Şifre hashleniyor
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Uyeler (Ad, Soyad, Email, Sifre, Universite) VALUES (@Ad, @Soyad, @Email, @Sifre, @Universite)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Ad", ad);
                        cmd.Parameters.AddWithValue("@Soyad", soyad);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Sifre", hashedPassword); // Hashlenmiş şifre
                        cmd.Parameters.AddWithValue("@Universite", universite);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblMessageKaydol.Text = "Kayıt başarılı!";
                            lblMessageKaydol.ForeColor = System.Drawing.Color.Green;
                            Response.Redirect("WebForm4.aspx"); // Kayıt başarılıysa yönlendirme
                        }
                        else
                        {
                            lblMessageKaydol.Text = "Kayıt sırasında bir hata oluştu.";
                            lblMessageKaydol.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessageKaydol.Text = "Bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.";
                lblMessageKaydol.ForeColor = System.Drawing.Color.Red;
                Console.WriteLine(ex.Message); // Geliştirici için hata detaylarını loglar
            }
        }

        
    }
}