namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ShopConfig")]
    public partial class ShopConfig
    {
        [StringLength(10)]
        public string id { get; set; }

        [StringLength(50)]
        public string shopName { get; set; }

        [StringLength(255)]
        public string imageLogo { get; set; }

        [StringLength(20)]
        public string mobile { get; set; }

        [StringLength(255)]
        public string address { get; set; }

        [StringLength(50)]
        public string gmail { get; set; }

        [StringLength(255)]
        public string facebook { get; set; }

        [StringLength(255)]
        public string instagram { get; set; }

        [StringLength(255)]
        public string twitter { get; set; }

        [StringLength(255)]
        public string youtube { get; set; }
    }
}
