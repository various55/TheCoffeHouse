namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            UserRoles = new HashSet<UserRole>();
        }

        [StringLength(10)]
        public string id { get; set; }

        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage ="Username is required")]
        [StringLength(25)]
        public string username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Password is required")]
        [StringLength(256)]
        public string password { get; set; }

        [StringLength(20)]
        public string phoneNumber { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DOB { get; set; }

        [StringLength(50)]
        public string fullName { get; set; }

        [StringLength(50)]
        public string address { get; set; }

        public double? total { get; set; }

        public bool? status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
