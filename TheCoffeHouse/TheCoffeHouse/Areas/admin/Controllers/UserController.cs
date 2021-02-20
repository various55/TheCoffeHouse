using Data.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheCoffeHouse.Areas.admin.Helpers;
using TheCoffeHouse.Models;

namespace TheCoffeHouse.Areas.admin.Controllers
{
    public class UserController : Controller
    {
        // GET: admin/User
        public ActionResult Index()
        {

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            var res = new UserDAO().Login(model.Username, model.Password);
            if (res && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { UserName = model.Username });
                return RedirectToAction("Index","Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không tồn tại");
            }
            return View("Index");
        }
    }
}