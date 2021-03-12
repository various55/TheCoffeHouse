using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    public abstract class RepositoryBase<T> : IRepository<T> where T : class
    {
        private MyDbContext context;
        private readonly DbSet<T> db;

        public T add(T model)
        {
            return db.Add(model);
        }
    }
}
