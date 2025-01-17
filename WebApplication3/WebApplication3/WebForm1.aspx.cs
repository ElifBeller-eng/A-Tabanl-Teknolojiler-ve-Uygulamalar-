using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Sayfa yüklendiğinde yapılacak işlemler
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sayfa ilk yüklendiğinde yapılacak işlemler burada
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }
    }
}