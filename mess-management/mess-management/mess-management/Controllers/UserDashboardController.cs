using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mess_management.Controllers
{
    public class UserDashboardController : Controller
    {
        // GET: UserDashboard
        public ActionResult Index()
        {
            return View();
        }
    }
}