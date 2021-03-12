namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Role : AbstractModel
    {
        public virtual ICollection<Permission> Permissions { get; set; }

        public virtual ICollection<UserRole> UserRoles { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}
