using System.Web;
using System.Web.Optimization;

namespace TheCoffeHouse
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Assets/home/js/jquery.min.js",
                        "~/Assets/home/js/jquery-ui.min.js",
                        "~/Assets/home/js/jquery-migrate-3.0.0.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"
                      ));
            bundles.Add(new StyleBundle("~/Content/myCss").Include(
            "~/Assets/admin/dist/css/adminlte.min.css"
            ));
            bundles.Add(new StyleBundle("~/Content/myJs").Include(
                "~/Content/mycss/style.css"
                ));
        }
    }
}
