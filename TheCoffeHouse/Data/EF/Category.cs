namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Category : AbstractModel
    {
        public Category()
        {
            isShowOnHome = true;
            status = true;
        }

        public bool? isShowOnHome { get; set; }

        public bool? status { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
