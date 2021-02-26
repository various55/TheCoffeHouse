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
        private WebDbContext context = null;

        public ProductsDAO()
        {
            context = new WebDbContext();
        }
        public List<Product> findAll()
        {
            var products = context.Database.SqlQuery<Product>("usp_SelectProductsAll").ToList();
            return products;
        }
        public List<Product> findById(string id)
        {
            object[] sqlParams =
            {
                new SqlParameter("@id", id ),
            };
            var products = context.Database.SqlQuery<Product>("usp_SelectProduct",sqlParams).ToList();
            return products;
        }
    }
}
