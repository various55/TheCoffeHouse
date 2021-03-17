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
        private MyDbContext context = null;

        public UserDAO()
        {
          context = new MyDbContext();
        }
        public bool Login(String username,string password)
        {
            var res = context.Users.SingleOrDefault(x => x.username == username && x.password == password);
            return res != null;
        }
        public User findByUsername(String username)
        {
            var user = context.Users.Where(u => u.username == username).FirstOrDefault();
            return user;
        }

    }
}
