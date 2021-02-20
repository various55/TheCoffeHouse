namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Transaction
    {
        [StringLength(10)]
        public string id { get; set; }

        [StringLength(10)]
        public string userId { get; set; }

        [Required]
        [StringLength(10)]
        public string orderId { get; set; }

        [StringLength(10)]
        public string createdBy { get; set; }

        public DateTime? createdAt { get; set; }

        [StringLength(255)]
        public string message { get; set; }

        public bool? status { get; set; }

        public virtual Order Order { get; set; }
    }
}
