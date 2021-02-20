namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string orderId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string productId { get; set; }

        public int? quantity { get; set; }

        public double? price { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
