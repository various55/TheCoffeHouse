using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TheCoffeHouse.Models
{
    [Table("Users")]
    public class LoginModel
    {
        private string username;
        private string password;


        private bool isRememberMe;

        public LoginModel()
        {

        }

        public LoginModel(string username, string password, bool isRememberMe)
        {
            this.username = username;
            this.password = password;
            this.isRememberMe = isRememberMe;
        }

        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = ("Tài khoản không được để trống"))]
        public string Username { get => username; set => username = value; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = ("Mật khẩu không được để trống"))]
        public string Password { get => password; set => password = value; }
        public bool IsRememberMe { get => isRememberMe; set => isRememberMe = value; }
    }
}