using Business.Service;
using Data.Dao;
using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Business.ModelView;

namespace TheCoffeHouse.Controllers
{
    public class ProductsController : Controller
    {
        private readonly IProductService productService;
        private readonly ICategoryService categoryService;
        public ProductsController()
        {

        }

        public ProductsController(IProductService productService, ICategoryService categoryService)
        {
            this.productService = productService;
            this.categoryService = categoryService;
        }
        // GET: Products
        public ActionResult Index()
        {
            var products = productService.findAll();
            return View(products);
        }
        [ChildActionOnly]
        public ActionResult Categories()
        {
            var cateories = categoryService.findAll();
            return PartialView("_MenuCategoriesPartial",cateories);
        }
        [HttpGet]
        public ActionResult Details(string id)
        {
            var product = new ProductsDAO();
            var model = product.findById(id);
            return View(model);
        }
        [HttpGet]
        public ActionResult Products()
        {
            var products = productService.findAll().Where(p => p.isShowOnHome == true).ToList();
            return PartialView("Products/_ProductsPartial",products);
        }
        [HttpPost]
        public ActionResult FilterAndPagination(RequestData requestData)
        {
            var id = requestData.idCategory;
            if (id < 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var products = productService.FilterAndPagination(requestData);
            // Hiển thị những hình ảnh có status = true

            return PartialView("Products/_ProductsPartial", products.data);
        }
    }
}