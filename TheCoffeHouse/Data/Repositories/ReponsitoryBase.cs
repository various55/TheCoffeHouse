using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Data.Repositories
{
    public abstract class RepositoryBase<T> : IRepository<T> where T : class
    {
        // Triển khai Generic được định nghĩa trong IRepository
        private MyDbContext context;

        private DbSet<T> dbSet;

        public IDbFactory DbFactory { get; private set; }

        public MyDbContext DbContext
        {
            get { return context ?? (context = DbFactory.Init()); }
        }

        public RepositoryBase(IDbFactory dbFactory)
        {
            DbFactory = dbFactory;
            this.dbSet = DbContext.Set<T>();
        }

        public virtual T add(T model)
        {
            return dbSet.Add(model);
        }

        public virtual void update(T model)
        {
            dbSet.Attach(model);
            context.Entry(model).State = EntityState.Modified;
            context.SaveChanges();
        }

        public virtual T delete(int id)
        {
            var entity = dbSet.Find(id);
            return dbSet.Remove(entity);
        }

        public virtual IEnumerable<T> findAll()
        {
            return dbSet.ToList();
        }

        public virtual T findById(int id)
        {
            return dbSet.Find(id);
        }

        public virtual T delete(T model)
        {
            return dbSet.Remove(model);
        }

        public virtual IEnumerable  <T> findAll(string[] includes = null)
        {
            if (includes == null) return findAll();
            if (includes != null && includes.Count() > 0)
            {
                var query = context.Set<T>().Include(includes.First());
                foreach (var include in includes.Skip(1))
                    query = query.Include(include);
                return query.AsQueryable().ToList();
            }

            return context.Set<T>().AsQueryable().ToList();
        }
    }
}