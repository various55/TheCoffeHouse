using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Business.ModelView
{
    public class ResponseData<T>
    {
        public List<T> data { get; set; }
        public int pageSize { get; set; }
        public int pageNumber { get; set; }
        public int pageCount { get; set; }
        
    }
}