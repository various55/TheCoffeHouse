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
        public int id { get; set; }

        public int roleId { get; set; }

        public int functionId { get; set; }

        public int actionId { get; set; }

        [ForeignKey("roleId")]
        public virtual Action Action { get; set; }

        [ForeignKey("functionId")]
        public virtual Function Function { get; set; }

        [ForeignKey("actionId")]
        public virtual Role Role { get; set; }
    }
}
