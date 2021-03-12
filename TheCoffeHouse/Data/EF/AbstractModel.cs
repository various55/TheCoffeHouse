using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.EF
{
    public class AbstractModel
    {
        [Key]
        public int id { get; set; }

        [Required]
        [Display(Name ="Tên ")]
        [StringLength(56)]
        public string name { get; set; }

    }
}
