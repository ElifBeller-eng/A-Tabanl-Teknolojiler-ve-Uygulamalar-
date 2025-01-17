using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace WebApplication3
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Uygulama başlangıcında çalışacak kod
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
