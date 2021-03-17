using Data.EF;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class ProductsDAO
    {
        private MyDbContext context = null;

        public ProductsDAO()
        {
            context = new MyDbContext();
        }
        public List<Product> findAll()
        {
            var products = context.Products.ToList();
            return products;
        }
        public List<Product> findById(string id)
        {
            List<Product> products = new List<Product>();
            var product = context.Products.Find(id);
            products.Add(product);
            return products;
        }
        public int add(Product p)
        {
            context.Products.Add(p);
            return context.SaveChanges();
        }
    }
}
