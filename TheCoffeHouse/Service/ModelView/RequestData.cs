using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Business.ModelView
{
    public class RequestData
    {
        public int? idCategory { get; set; }
        public int? pageSize { get; set; }
        public int? pageNumber { get; set; }

        public string search { get; set; }
        public string sortBy { get; set; }
        public bool? isAsc { get; set; }

    }
}