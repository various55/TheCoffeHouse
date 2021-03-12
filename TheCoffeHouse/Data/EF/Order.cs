namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order : AbstractModel
    {
        public Order()
        {
        }

        [Required]
        public int? createdBy { get; set; }

        [Required]
        public int? userId { get; set; }

        [Required]
        public DateTime? orderDate { get; set; }

        [StringLength(50)]
        public string shipName { get; set; }

        [StringLength(255)]
        public string shipAddress { get; set; }

        [StringLength(20)]
        public string shipPhoneNumber { get; set; }

        [Required]
        public int? status { get; set; }

        public int typeId { get; set; }

        public double? fee { get; set; }

        public double? discount { get; set; }

        public double? total { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        [ForeignKey("typeId")]
        public virtual Type Type { get; set; }

        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
