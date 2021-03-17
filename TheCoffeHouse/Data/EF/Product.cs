namespace Data.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product :AbstractModel
    {
        public Product()
        {
            isShowOnHome = true;
        }

        [Display(Name ="Miêu tả")]
        [StringLength(255)]
        public string description { get; set; }

        [Required]
        [Display(Name ="Giá")]
        public double? price { get; set; }

        [Display(Name ="Nội dung chi tiết")]
        [Column(TypeName = "ntext")]
        public string details { get; set; }

        [Required]
        [Display(Name ="Hiển thị trên trang chủ")]
        public bool? isShowOnHome { get; set; }

        [Required]
        [Display(Name ="Giảm giá")]
        public double? discount { get; set; }

        [Display(Name ="Số lượng order")]
        public int? quantityOrder { get; set; }

        [Display(Name ="Ảnh")]
        [StringLength(255)]
        public string image { get; set; }

        [Display(Name ="Danh mục")]
        [Required]
        public int categoriesId { get; set; }

        [ForeignKey("categoriesId")]
        public virtual Category Category { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual ICollection<Status> Status { get; set; }
    }
}
