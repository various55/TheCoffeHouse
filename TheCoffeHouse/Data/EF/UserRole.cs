namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class UserRole
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string userId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string roleId { get; set; }

        public virtual Role Role { get; set; }

        public virtual User User { get; set; }
    }
}
