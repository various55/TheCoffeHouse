    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    interface IRepository<T> where T : class
    {
        T add(T model);
    }
}
