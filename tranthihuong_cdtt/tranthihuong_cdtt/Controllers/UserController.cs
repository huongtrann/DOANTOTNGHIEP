using tranthihuong_cdtt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using tranthihuong_cdtt.ViewModels;

namespace tranthihuong_cdtt.Controllers
{
    public class UserController : BaseController
    {
        ShoppingEntities db = new ShoppingEntities();
        public bool CheckRole(string type)
        {
            Models.User user = Session["User"] as Models.User;
            if (user.UserType.Name == type)
            {
                return true;
            }
            return false;
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ConfirmEmail(int ID)
        {
            Models.User user = db.Users.SingleOrDefault(x => x.ID == ID);
            if (user.IsConfirm.Value)
            {
                ViewBag.Message = "EmailConfirmed";
                return View();
            }
            string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Url.Content("~");
            ViewBag.Email = "Truy cập vào Email để xác minh tài khoản: " + user.Email;
            SentMail("Mã xác minh tài khoản", user.Email, "tuonglaisang800@gmail.com", "epsncolkyytknzjv", "Xác minh nhanh bằng cách click vào link: " + urlBase + "User/ConfirmEmailLink/" + ID + "?Captcha=" + user.Captcha + "</p>");
            return View();
        }
        [HttpGet]
        public ActionResult ConfirmEmailLink(int ID, string Captcha)
        {
            User user = db.Users.SingleOrDefault(x => x.ID == ID && x.Captcha == Captcha);
            if (user != null)
            {
                user.IsConfirm = true;
                db.SaveChanges();
                ViewBag.Message = "Xác minh tài khoản thành công";
                return View();
            }
            ViewBag.Message = "Mã xác minh tài khoản không đúng";
            return View();
        }
        public void SentMail(string Title, string ToEmail, string FromEmail, string Password, string Content)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(ToEmail);
            mail.From = new MailAddress(ToEmail);
            mail.Subject = Title;
            mail.Body = Content;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(FromEmail, Password);
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        public ActionResult CheckoutOrder()
        {
            if (CheckRole("Client"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            Models.User user = Session["User"] as Models.User;
            List<Order> orders = db.Orders.Where(x => x.UserID == user.ID).ToList();
            return View(orders);
        }
        public ActionResult OrderDetails(int ID)
        {
            if (CheckRole("Client"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            List<OrderDetail> orderDetails = db.OrderDetails.Where(x => x.OrderID.Value == ID).ToList();
            return View(orderDetails);
        }
        public ActionResult Complete(int ID)
        {
            Order order = db.Orders.Find(ID);
            order.Status = "Complete";
            order.DateShip = DateTime.Now;
            db.SaveChanges();

            // Cập nhật sản phẩm
            List<OrderDetail> orderDetails = db.OrderDetails.Where(x => x.OrderID.Value == ID).ToList();
            foreach (var item in orderDetails)
            {
                Product product = db.Products.Find(item.ProductID);
                product.Quantity -= item.Quantity;
                product.PurchasedCount += item.Quantity;
                db.SaveChanges();
            }
            return RedirectToAction("CheckoutOrder");
        }

        public ActionResult Profile()
        {
            if (Session["User"] is User user)
            {
                var model = new UserProfileViewModel()
                {
                    UserTypeID = user.UserTypeID,
                    Name = user.Name,
                    Address = user?.Address,
                    Captcha = user?.Captcha,
                    IsConfirm = user.IsConfirm,
                    Phone = user.Phone,
                    Email = user.Email,
                    ID = user.ID,
                    Password = user.Password,
                    ConfirmPassword = user.Password
                };
                return View(model);
            }

            return RedirectToAction("Index", "Home");
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Profile(UserProfileViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);
            try
            {
                var user = db.Users.SingleOrDefault(n => n.ID == model.ID);

                if (user != null)
                {
                    user.Address = model.Address;
                    user.Name = model.Name;
                    user.Password = model.Password;
                    user.Phone = model.Phone;
                    user.Email = model.Email;

                    db.SaveChanges();
                    Alert("Cập nhật thành công!");
                    return View(model);
                }
            }
            catch (Exception e)
            {
                Alert("Cập nhật không thành công", true);
                return View(model);
            }
            return View(model);
        }
    }
}