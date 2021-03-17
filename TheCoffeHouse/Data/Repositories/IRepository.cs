    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    public interface IRepository<T> where T : class
    {

        // Repository pattern
        T add(T model);
        void update(T model);
        T delete(int id);
        T delete(T model);

        IEnumerable<T> findAll();

        IEnumerable<T> findAll(string[] includes = null);
        T findById(int id);

    }
}
