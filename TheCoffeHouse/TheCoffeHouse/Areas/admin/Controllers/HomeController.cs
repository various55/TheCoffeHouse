using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheCoffeHouse.Areas.admin.Constains;

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
        public ActionResult GetUsername()
        {
            var username = Session[SessionConst.SESSION_LOGIN];
            if(!String.IsNullOrEmpty(username.ToString()))
            {
                ViewBag.username = username.ToString();
            }
            else
            {
                RedirectToAction("Login","User");
            }
            return PartialView("Layout/_LeftMenuPartial");
        }
    }
}