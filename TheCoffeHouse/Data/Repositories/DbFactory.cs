using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    public class DbFactory : Disposable, IDbFactory
    {
        // Factory dùng để khởi tạo MyDbcontext
        private MyDbContext dbContext; 

        public MyDbContext Init()
        {
            return dbContext = (dbContext ?? new MyDbContext());
        }
        protected override void DisposeCore()
        {
            if (dbContext != null) dbContext.Dispose();
        }

    }
}
