namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
            Transactions = new HashSet<Transaction>();
        }

        [StringLength(10)]
        public string id { get; set; }

        [StringLength(10)]
        public string createdBy { get; set; }

        [StringLength(10)]
        public string userId { get; set; }

        public DateTime? orderDate { get; set; }

        [StringLength(50)]
        public string shipName { get; set; }

        [StringLength(255)]
        public string shipAddress { get; set; }

        [StringLength(20)]
        public string shipPhoneNumber { get; set; }

        public int? status { get; set; }

        [Required]
        [StringLength(10)]
        public string typeId { get; set; }

        public double? fee { get; set; }

        public double? discount { get; set; }

        public double? total { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual Type Type { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
