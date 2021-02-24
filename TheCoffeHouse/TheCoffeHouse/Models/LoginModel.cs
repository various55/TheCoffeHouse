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
        [Required]
        private string username;
        private string password;

        public LoginModel()
        {

        }

        public LoginModel(string username, string password)
        {
            this.username = username;
            this.password = password;
        }

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
    }
}