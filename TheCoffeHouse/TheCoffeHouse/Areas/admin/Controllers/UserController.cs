using Data.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TheCoffeHouse.Areas.admin.Constains;
using TheCoffeHouse.Areas.admin.Helpers;
using TheCoffeHouse.Models;

namespace TheCoffeHouse.Areas.admin.Controllers
{
    public class UserController : Controller
    {

        // GET: admin/User
        public ActionResult Index()
        {
            var session = Session[SessionConst.SESSION_LOGIN];
            if (session != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            //var res = new UserDAO().Login(model.Username, model.Password);
            var res = Membership.ValidateUser(model.Username, model.Password);
            if (res && ModelState.IsValid)
            {
                //SessionHelper.SetSession(new UserSession() { UserName = model.Username });
                FormsAuthentication.SetAuthCookie(model.Username,true);
                Session[SessionConst.SESSION_LOGIN] = model.Username;
                return RedirectToAction("Index","Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không tồn tại");
            }
            return View("Index");
        }
        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Remove(SessionConst.SESSION_LOGIN);
            return RedirectToAction("Index","User");
        }
    }
}