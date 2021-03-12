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
        public int id { get; set; }

        public int userId { get; set; }

        public int roleId { get; set; }
        
        [ForeignKey("roleId")]
        public virtual Role Role { get; set; }

        [ForeignKey("userId")]
        public virtual User User { get; set; }
    }
}
