using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Implement
{
    public interface IShopConfigRepository : IRepository<ShopConfig>
    {

    }
    public class ShopConfigRepository : RepositoryBase<ShopConfig>, IShopConfigRepository
    {
        public ShopConfigRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

    }
}
