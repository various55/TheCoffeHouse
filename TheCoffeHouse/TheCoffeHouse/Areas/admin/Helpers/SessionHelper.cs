using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheCoffeHouse.Areas.admin.Helpers
{
    public class SessionHelper
    {
        public static void SetSession(UserSession session)
        {
            HttpContext.Current.Session["loginSession"] = session;
        }
        public static UserSession GetSession()
        {
            var session = HttpContext.Current.Session["loginSession"];
            if (session == null) return null;
            return session as UserSession;
        }
    }
}