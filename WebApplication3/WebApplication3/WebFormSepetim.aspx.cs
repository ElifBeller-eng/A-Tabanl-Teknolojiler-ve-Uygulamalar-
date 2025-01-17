using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebFormSepetim : System.Web.UI.Page
    {
        private List<SepetElemani> Sepet = new List<SepetElemani>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvSepet.DataSource = Sepet;
                gvSepet.DataBind();
                ToplamTutariHesapla();
            }
        }
        private void ToplamTutariHesapla()
        {
            decimal toplam = 0;
            foreach (var item in Sepet)
            {
                toplam += item.Fiyat;
            }
            // "tr-TR" kültürünü kullanarak Türk Lirası formatını uygula
            lblToplamTutar.Text = toplam.ToString("C", new System.Globalization.CultureInfo("tr-TR"));
        }
        protected void btnOnayla_Click(object sender, EventArgs e)
        {
            // Ödeme sayfasına yönlendirme
            if (Sepet.Count > 0)
            {
                // Ödeme sayfasına yönlendirme
                Response.Redirect("Odeme.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sepetiniz boş! Lütfen dosya ekleyin.');", true);
            }
        }

        public class SepetElemani
        {
            public string DosyaAdi { get; set; }
            public decimal Fiyat { get; set; }
        }
    }
}