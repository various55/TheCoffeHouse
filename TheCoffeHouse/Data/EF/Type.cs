namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Type : AbstractModel
    {
        public Type()
        {
        }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
