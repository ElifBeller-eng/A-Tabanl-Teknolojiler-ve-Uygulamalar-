using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace WebApplication3
{
    public partial class WebForm5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDosyaYukle_Click(object sender, EventArgs e)
        {
            // Dosya seçilmiş mi kontrol et
            if (fileUpload.HasFile)
            {
                // Dosya boyutunu kontrol et (100 MB'yi geçemez)
                if (fileUpload.PostedFile.ContentLength > 100 * 1024 * 1024)
                {
                    Response.Write("<script>alert('Dosya boyutu 100 MB\\'yi geçemez.');</script>");
                    return;
                }

                try
                {
                    // Kullanıcı tarafından verilen dosya adı
                    string kullaniciDosyaAdi = txtDosyaAdi.Text.Trim();

                    // Dosya adı boşsa hata göster
                    if (string.IsNullOrEmpty(kullaniciDosyaAdi))
                    {
                        Response.Write("<script>alert('Lütfen dosya adını girin.');</script>");
                        return;
                    }

                    string kullaniciEmail = Session["UserEmail"]?.ToString();
                    if (string.IsNullOrEmpty(kullaniciEmail))
                    {
                        Response.Write("<script>alert('Kullanıcı girişi yapılmadığından işlem tamamlanamadı.');</script>");
                        return;
                    }

                    // Dosya uzantısını al ve dosya adını düzenle
                    string dosyaUzantisi = Path.GetExtension(fileUpload.PostedFile.FileName);
                    string tamDosyaAdi = kullaniciDosyaAdi + dosyaUzantisi;

                    // Dosya içeriğini veritabanına kaydetmek için okuma
                    byte[] dosyaVerisi;
                    using (BinaryReader br = new BinaryReader(fileUpload.PostedFile.InputStream))
                    {
                        dosyaVerisi = br.ReadBytes(fileUpload.PostedFile.ContentLength);
                    }

                    // Dosya yolunu al
                    string dosyaYolu = Server.MapPath("~/Dosyalar/" + tamDosyaAdi);

                    // Veritabanına kaydet
                    string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        try
                        {
                            con.Open();
                            Response.Write("<script>alert('Bağlantı başarılı.');</script>");

                            string query = "INSERT INTO Dosyalar (DosyaAdi,DosyaVerisi, DosyaYolu, YuklenmeTarihi, KullaniciEmail) VALUES (@DosyaAdi, @DosyaVerisi, @DosyaYolu, @YuklenmeTarihi, @KullaniciEmail)";
                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.Add("@DosyaAdi", SqlDbType.VarChar).Value = tamDosyaAdi;
                                cmd.Parameters.Add("@DosyaVerisi", SqlDbType.VarBinary).Value = dosyaVerisi;
                                cmd.Parameters.Add("@DosyaYolu", SqlDbType.VarChar).Value = dosyaYolu;
                                cmd.Parameters.Add("@YuklenmeTarihi", SqlDbType.DateTime).Value = DateTime.Now;
                                cmd.Parameters.Add("@KullaniciEmail", SqlDbType.VarChar).Value = kullaniciEmail; // Dinamik değer girin

                                int rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    Response.Write("<script>alert('Dosya başarıyla yüklendi.');</script>");
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnGeriDon_Click(object sender, EventArgs e)
        {
            // WebForm4 sayfasına yönlendirme
            Response.Redirect("WebForm4.aspx");
        }

    }
}
