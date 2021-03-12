namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Action : AbstractModel
    {
        public int test { get; set; }
        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
