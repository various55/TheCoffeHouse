namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Transaction : AbstractModel
    {

        public int userId { get; set; }

        public int orderId { get; set; }

        public int? createdBy { get; set; }

        public DateTime? createdAt { get; set; }

        [StringLength(255)]
        public string message { get; set; }

        public bool? status { get; set; }

        [ForeignKey("orderId")]
        public virtual Order Order { get; set; }


        [ForeignKey("userId")]
        public virtual User User { get; set; }
    }
}
