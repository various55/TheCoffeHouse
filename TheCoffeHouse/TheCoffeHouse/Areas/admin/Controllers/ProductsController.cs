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
                product.image = ImagesConst.URL_IMAGE + product.image;
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
            return View();
        }

        // POST: admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,description,price,details,isShowOnHome,discount,quantityOrder,image,categoriesId")] Product product)
        {
            return View(product);
        }

        // GET: admin/Products/Delete/5
        public ActionResult Delete(int id)
        {
            /*
            if (id < 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            */
            return View();
        }

        // POST: admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            /*
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            */
            return RedirectToAction("Index");
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
    }
}
