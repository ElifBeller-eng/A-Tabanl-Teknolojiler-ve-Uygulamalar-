using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm4 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kullanıcı oturum kontrolü
            if (Session["UserEmail"] == null)
            {
                // Eğer oturum açılmamışsa, giriş sayfasına yönlendirin
                Response.Redirect("WebForm3.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Sistemdeki tüm dosyaları göster
                LoadTümDosyalar();
                LoadUniversiteler();
            }
        }

        private void LoadUniversiteler()
        {
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";
            string query = "SELECT UniversiteID, UniversiteAdi FROM Universiteler ORDER BY UniversiteAdi";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlUniversiteler.DataSource = reader;
                    ddlUniversiteler.DataTextField = "UniversiteAdi";
                    ddlUniversiteler.DataValueField = "UniversiteID";
                    ddlUniversiteler.DataBind();
                }
            }

            ddlUniversiteler.Items.Insert(0, new ListItem("Üniversite Seçin", ""));
        }

        private string ConvertToVirtualPath(string fizikselYol)
        {
            // Server.MapPath ile fiziksel yolu sanal yola çeviriyoruz
            string sanalYol = fizikselYol.Replace(Server.MapPath("~/"), "~/").Replace("\\", "/");
            return ResolveUrl(sanalYol);
        }
        protected void ddlUniversiteler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int universiteID = Convert.ToInt32(ddlUniversiteler.SelectedValue);
            LoadBolumler(universiteID);
        }

        private void LoadBolumler(int universiteID)
        {
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";
            string query = "SELECT BolumID, BolumAdi FROM Bolumler WHERE UniversiteID = @UniversiteID ORDER BY BolumAdi";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UniversiteID", universiteID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlBolumler.DataSource = reader;
                    ddlBolumler.DataTextField = "BolumAdi";
                    ddlBolumler.DataValueField = "BolumID";
                    ddlBolumler.DataBind();
                }
            }

            ddlBolumler.Items.Insert(0, new ListItem("Bölüm Seçin", ""));
        }

        protected void btnKullaniciBilgileri_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebFormKullaniciBilgi.aspx");
        }

        protected void btnUniversiteler_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebFormUniversiteler.aspx");
        }

        protected void btnBolumler_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebFormBolumler.aspx");
        }

        protected void btnNotPaylas_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm5.aspx");
        }

        protected void btnArama_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlUniversiteler.SelectedValue) || string.IsNullOrEmpty(ddlBolumler.SelectedValue))
            {
                Response.Write("<script>alert('Lütfen hem üniversite hem de bölüm seçin.');</script>");
                return;
            }

            int universiteID = Convert.ToInt32(ddlUniversiteler.SelectedValue);
            int bolumID = Convert.ToInt32(ddlBolumler.SelectedValue);

            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";
            string query = "SELECT DosyaAdi, DosyaYolu FROM Dosyalar WHERE UniversiteID = @UniversiteID AND BolumID = @BolumID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UniversiteID", universiteID);
                    cmd.Parameters.AddWithValue("@BolumID", bolumID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        gvDosyalar.DataSource = reader;
                        gvDosyalar.DataBind();
                    }
                    else
                    {
                        gvDosyalar.DataSource = null;
                        gvDosyalar.DataBind();
                        Response.Write("<script>alert('Bu üniversite ve bölüm için dosya bulunamadı.');</script>");
                    }
                }
            }
        }

        private void LoadTümDosyalar()
        {
            string connectionString = "Data Source=DESKTOP-PC3NTDQ\\SQLEXPRESS04;Initial Catalog=Kullanıcı;Integrated Security=True";
            string query = "SELECT DosyaAdi, DosyaYolu FROM Dosyalar";  // Burada veritabanındaki tüm dosyaları çekiyoruz.

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Veriyi DataTable'a yükleyin
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // SanalDosyaYolu sütunu ekleniyor
                        dt.Columns.Add("SanalDosyaYolu", typeof(string));

                        // DataTable'daki her satır için fiziksel yolu sanal yola dönüştür
                        foreach (DataRow row in dt.Rows)
                        {
                            string fizikselYol = row["DosyaYolu"].ToString();
                            row["SanalDosyaYolu"] = ConvertToVirtualPath(fizikselYol);
                        }

                        // GridView'e DataTable bağla
                        gvDosyalar.DataSource = dt;
                        gvDosyalar.DataBind();
                    }
                    else
                    {
                        gvDosyalar.DataSource = null;  // Eğer dosya yoksa, GridView'i boş bırakıyoruz
                        gvDosyalar.DataBind();  // Yine boş bir şekilde görüntüleniyor
                        Response.Write("<script>alert('Henüz sisteme dosya yüklenmemiş.');</script>");
                    }
                }
            }
        }

        protected void btnCikisYap_Click(object sender, EventArgs e)
        {
            // Oturumu sonlandır
            Session.Abandon();

            // Giriş sayfasına yönlendir
            Response.Redirect("WebForm3.aspx"); // Giriş sayfanızın ismi
        }
    }
}