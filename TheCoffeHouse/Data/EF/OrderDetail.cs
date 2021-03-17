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
        public int id { get; set; }

        public int orderId { get; set; }

        public int productId { get; set; }

        public int? quantity { get; set; }

        public double? price { get; set; }

        [ForeignKey("orderId")]
        public virtual Order Order { get; set; }

        [ForeignKey("productId")]
        public virtual Product Product { get; set; }
    }
}
