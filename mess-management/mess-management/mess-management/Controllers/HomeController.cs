using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mess_management.Models;
using System;


namespace mess_management.Controllers
{
    public class HomeController : Controller
    {
        private MessEntities1 db = new MessEntities1();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        
        // GET: /Home/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: /Home/RegisterUser
        [HttpPost]
        [ValidateAntiForgeryToken] // Use anti-forgery token for security
        public ActionResult RegisterUser(string role, User user, Manager manager)
        {
            if (ModelState.IsValid)
            {
                if (role == "User")
                {
                    db.Users.Add(user);
                }
                else if (role == "Manager")
                {
                    db.Managers.Add(manager);
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // If ModelState is not valid, return to the registration view with errors
            return View("Register", new Tuple<User, Manager>(user, manager));
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
