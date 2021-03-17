namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User : AbstractModel
    {
        public User()
        {
        }

        [StringLength(25)]
        public string username { get; set; }

        [StringLength(256)]
        public string password { get; set; }

        public int? role { get; set; }

        [StringLength(20)]
        public string phoneNumber { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DOB { get; set; }

        [StringLength(50)]
        public string address { get; set; }

        public double? total { get; set; }

        public bool? status { get; set; }

        public virtual ICollection<Transaction> Transactions { get; set; }

    }
}
