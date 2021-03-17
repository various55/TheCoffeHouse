﻿using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Implement
{
    public interface IUserReponsitory : IRepository<User>
    {

    }
    public class UserRepository : RepositoryBase<User>, IUserReponsitory
    {
        public UserRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

    }
}
