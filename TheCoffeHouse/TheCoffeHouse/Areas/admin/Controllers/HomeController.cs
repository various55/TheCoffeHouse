using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheCoffeHouse.Areas.admin.Controllers
{
    [Authorize]
    //[AllowAnonymous]
    public class HomeController : Controller
    {
        // GET: admin/Home
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult Navbar()
        {
            String[] items = { "Home","Contact" };
            ViewBag.items = items;
            return PartialView("_NavbarPartial",items);
        }
    }
}