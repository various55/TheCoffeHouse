using Data.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheCoffeHouse.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index()
        {
            var products = new ProductsDAO();
            var model = products.findAll();
            return View(model);
        }
        [ChildActionOnly]
        public ActionResult Categories()
        {
            var categories = new CategoriesDAO();
            var model = categories.findAll();
            return PartialView("_MenuCategoriesPartial",model);
        }
        [HttpGet]
        public ActionResult Details(string id)
        {
            var product = new ProductsDAO();
            var model = product.findById(id);
            return View(model);
        }
    }
}