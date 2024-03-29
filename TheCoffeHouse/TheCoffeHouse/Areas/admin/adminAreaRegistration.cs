﻿using System.Web.Mvc;

namespace TheCoffeHouse.Areas.admin
{
    public class adminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "admin_default",
                "admin/{controller}/{action}/{id}",
                new { controller ="User", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "TheCoffeHouse.Areas.admin.Controllers" }
            );
        }
    }
}