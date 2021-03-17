using Data.EF;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class AbstractDAO<T> 
    {
        protected MyDbContext context = null;

        public AbstractDAO()
        {
            context = context ?? new MyDbContext();
        }
    }
}
