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
    [AllowAnonymous]
    public class UserController : Controller
    {

        // GET: admin/User
        public ActionResult Index()
        {
            // Kiểm tra xem đã đăng nhập chưa, nếu đăng nhập rồi thì redirect sang trang chủ admin
            if (Request.Cookies[CookieConst.COOKIE_LOGIN] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var res = Membership.ValidateUser(model.Username, model.Password);
                if (res)
                {
                    //SessionHelper.SetSession(new UserSession() { UserName = model.Username });
                    FormsAuthentication.SetAuthCookie(model.Username, true);
                    Response.Cookies[CookieConst.COOKIE_LOGIN].Value = model.Username;
                    Response.Cookies[CookieConst.COOKIE_LOGIN].Expires = DateTime.Now.AddDays(1);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không tồn tại");
                }
            }
            return View("Index");
        }
        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Response.Cookies[CookieConst.COOKIE_LOGIN].Expires = DateTime.Now.AddDays(-1);
            return RedirectToAction("Index","User");
        }
    }
}