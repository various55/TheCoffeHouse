using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TheCoffeHouse.Models
{
    public class LoginModel
    {
        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = ("Tài khoản không được để trống"))]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = ("Mật khẩu không được để trống"))]
        public string Password { get; set; }
        public bool IsRememberMe { get; set; }
    }
}