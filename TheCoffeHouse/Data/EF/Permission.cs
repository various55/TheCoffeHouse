namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Permission
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string roleId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string functionId { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string actionId { get; set; }

        public virtual Action Action { get; set; }

        public virtual Function Function { get; set; }

        public virtual Role Role { get; set; }
    }
}
