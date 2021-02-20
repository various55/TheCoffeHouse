using Data.EF;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dao
{
    public class UserDAO
    {
        private WebDbContext context = null;

        public UserDAO()
        {
          context = new WebDbContext();
        }
        public bool Login(String username,string password)
        {
            object[] sqlParams =
            {
                new SqlParameter("@username", username ),
                new SqlParameter("@password", password ),
            };
            var res = context.Database.SqlQuery<bool>("usp_login @username,@password", sqlParams).SingleOrDefault();
            return res;
        }

    }
}
