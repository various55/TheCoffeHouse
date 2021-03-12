using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class CategoriesDAO
    {
        private MyDbContext context = null;

        public CategoriesDAO()
        {
            context = new MyDbContext();
        }

        public List<Category> findAll()
        {
            var categories = context.Categories.ToList();
            return categories;
        }

    }
}
