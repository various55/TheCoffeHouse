using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data.Dao;
using TheCoffeHouse.Areas.admin.Helpers;
using TheCoffeHouse.Models;

namespace TheCoffeHouse.Controllers
{
    [AllowAnonymous]
    public class UserController : Controller
    {
        // GET: User
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            var res = new UserDAO().Login(model.Username,model.Password);
            if(res && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { UserName = model.Username });
                return Redirect("https://google.com");
            }else{
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không tồn tại");
            }
            return View("Index");
        }
        [HttpPost]
        public ActionResult Logout()
        {
            return View();
        }
    }
}