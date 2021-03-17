using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;
using Data.EF;

namespace TheCoffeHouse.Areas.admin.Controllers
{
    public class TransactionsController : Controller
    {
        private MyDbContext db = new MyDbContext();

        // GET: admin/Transactions
        public ActionResult Index()
        {
            var transactions = db.Transactions.Include(t => t.Order).Include(t => t.User);
            return View(transactions.ToList());
        }

        // GET: admin/Transactions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // GET: admin/Transactions/Create
        public ActionResult Create()
        {
            ViewBag.orderId = new SelectList(db.Orders, "id", "shipName");
            ViewBag.userId = new SelectList(db.Users, "id", "username");
            return View();
        }

        // POST: admin/Transactions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,userId,orderId,createdBy,createdAt,message,status,name")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.Transactions.Add(transaction);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.orderId = new SelectList(db.Orders, "id", "shipName", transaction.orderId);
            ViewBag.userId = new SelectList(db.Users, "id", "username", transaction.userId);
            return View(transaction);
        }

        // GET: admin/Transactions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            ViewBag.orderId = new SelectList(db.Orders, "id", "shipName", transaction.orderId);
            ViewBag.userId = new SelectList(db.Users, "id", "username", transaction.userId);
            return View(transaction);
        }

        // POST: admin/Transactions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,userId,orderId,createdBy,createdAt,message,status,name")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.Entry(transaction).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.orderId = new SelectList(db.Orders, "id", "shipName", transaction.orderId);
            ViewBag.userId = new SelectList(db.Users, "id", "username", transaction.userId);
            return View(transaction);
        }

        // GET: admin/Transactions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transaction transaction = db.Transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // POST: admin/Transactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Transaction transaction = db.Transactions.Find(id);
            db.Transactions.Remove(transaction);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
