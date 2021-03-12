using Data.Dao;
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
            var username = Request.Cookies[CookieConst.COOKIE_LOGIN].Value;
            if(!String.IsNullOrEmpty(username.ToString()))
            {
                var user = new UserDAO();
                //ViewBag.user = user.findByUsername(username);
            }
            else
            {
                RedirectToAction("Login","User");
            }
            return PartialView("Layout/_LeftMenuPartial");
        }
    }
}