using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data.EF;
namespace Data.Repositories.Implement
{
    public interface ITypeReponsitory : IRepository<EF.Type>
    {

    }
    public class TypeRepository : RepositoryBase<EF.Type>, ITypeReponsitory
    {
        public TypeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

    }
}
