using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data.Dao;
using Data;
using TheCoffeHouse.Areas.admin.Constains;
using Data.EF;
using Business.Service;

namespace TheCoffeHouse.Areas.admin.Controllers
{



    public class ProductsController : Controller
    {
        private readonly IProductService productService;
        private readonly ICategoryService categoryService;
        public ProductsController()
        {

        }

        public ProductsController(IProductService productService,ICategoryService categoryService)
        {
            this.productService = productService;
            this.categoryService = categoryService;
        }

        // GET: admin/Products
        public ActionResult Index()
        {
            var products = productService.findAll(new string[] { "Category" });
            return View(products);
        }

        // GET: admin/Products/Details/5
        public ActionResult Details(int id)
        {
            if (id < 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = productService.findById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoriesId = new SelectList(categoryService.findAll(), "id", "name", product.categoriesId);
            return View(product);
        }

        // GET: admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.categoriesId = new SelectList(categoryService.findAll(), "id", "name");
            return View();
        }

        // POST: admin/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                product.quantityOrder = 0;
                productService.add(product);
                productService.Save();
                return RedirectToAction("Index");
            }

            ViewBag.categoriesId = new SelectList(categoryService.findAll(), "id", "name", product.categoriesId);
            return View(product);
        }

        // GET: admin/Products/Edit/5
        public ActionResult Edit(int id)
        {
            if (id < -1)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = productService.findById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoriesId = new SelectList(categoryService.findAll(), "id", "name", product.categoriesId);
            return View(product);
        }

        // POST: admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,description,price,details,isShowOnHome,discount,quantityOrder,image,categoriesId")] Product product) 
        {
            if (ModelState.IsValid)
            {
                productService.update(product);
                productService.Save();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        // GET: admin/Products/Delete/5
        public ActionResult Delete(int id)
        {
            if (id < -1)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = productService.findById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            else
            {
                productService.delele(product);
                productService.Save();
            }
            var products = productService.findAll(new string[] { "Category" });
            return PartialView("Products/_ProductsPartial", products);
        }

        protected override void Dispose(bool disposing)
        {
            /*
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
            */
        }
        public JsonResult SwitchStatus(int id)
        {
            var message = "";
            if (id < -1)
            {
                message = "Id không tồn tại !";
                return Json(message, JsonRequestBehavior.AllowGet);
            }
            Product product = productService.findById(id);
            if (product == null)
            {
                message = "Sản phẩm không tồn tại !";
                return Json(message, JsonRequestBehavior.AllowGet);
            }
            else
            {
                product.isShowOnHome = !product.isShowOnHome;
                productService.update(product);
                productService.Save();
            }
            return Json("Success",JsonRequestBehavior.AllowGet);
        }
        public ActionResult Products()
        {
            var products = productService.findAll(new string[] { "Category" });
            return PartialView("Products/_ProductsPartial", products);
        }
    }
}
