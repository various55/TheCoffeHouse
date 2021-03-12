namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Function : AbstractModel
    {
        public Function()
        {
        }

        [StringLength(255)]
        public string url { get; set; }

        public int? parentId { get; set; }

        public bool? status { get; set; }

        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
