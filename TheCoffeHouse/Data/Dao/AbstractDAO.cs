using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class AbstractDAO
    {
        private WebDbContext context = null;

        public AbstractDAO()
        {
            context = new WebDbContext();
        }
    }
}
