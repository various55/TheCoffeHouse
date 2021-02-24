using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class CategoriesDAO
    {
        private WebDbContext context = null;

        public CategoriesDAO()
        {
            context = new WebDbContext();
        }

        public List<Category> findAll()
        {
            var categories = context.Database.SqlQuery<Category>("usp_SelectCategoriesAll").ToList();
            return categories;
        }

    }
}
