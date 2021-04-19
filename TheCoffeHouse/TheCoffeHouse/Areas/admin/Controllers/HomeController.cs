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
            if (String.IsNullOrEmpty(Request.Cookies[CookieConst.COOKIE_LOGIN].Value))
            {
                return RedirectToAction("Login", "User");
            }
            var username = Request.Cookies[CookieConst.COOKIE_LOGIN].Value;
            if(!String.IsNullOrEmpty(username.ToString()))
            {
                var userDAO = new UserDAO();
                var user = userDAO.findByUsername(username);
                return PartialView("Layout/_UserPartial", user);
            }
            else
            {
                return RedirectToAction("Login","User");
            }
        }
    }
}