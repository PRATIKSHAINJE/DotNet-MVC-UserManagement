using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class AccountController : Controller
    {
        string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection form)
        {
            string name = form["Name"];
            string username = form["Username"];
            string password = form["Password"];
            string confirm = form["ConfirmPassword"];
            string language = form["Language"];
            string mobile = form["Mobile"];
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                return Content("All fields are mandatory");

            if (!username.Contains("@"))
                return Content("Invalid Email");

            if (password.Length < 8)
                return Content("Password must be minimum 8 characters");

            if (password != confirm)
                return Content("Password mismatch");

            if (!string.IsNullOrEmpty(mobile) && mobile.Length != 10)
                return Content("Invalid Mobile Number");

            if (language != "EN" && language != "DE")
                return Content("Invalid Language");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string check = "SELECT COUNT(*) FROM Users WHERE Username=@Username";
                SqlCommand checkCmd = new SqlCommand(check, con);
                checkCmd.Parameters.AddWithValue("@Username", username);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                    return Content("Email already exists");
                string token = Guid.NewGuid().ToString();
                SqlCommand cmd = new SqlCommand("sp_RegisterUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Language", language);
                cmd.Parameters.AddWithValue("@Mobile", mobile ?? "");
                cmd.Parameters.AddWithValue("@Token", token);

                cmd.ExecuteNonQuery();
                string link = Url.Action("Verify", "Account",
                    new { token = token }, Request.Url.Scheme);

                return Content("Registered Successfully. Click to verify: " + link);
            }
        }
        public ActionResult Verify(string token)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "UPDATE Users SET IsVerified=1 WHERE VerificationToken=@t";

                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@t", token);

                con.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                    return Content("Account Verified Successfully. Now Login.");

                return Content("Invalid or Expired Token");
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_Login", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    bool isVerified = Convert.ToBoolean(dr["IsVerified"]);
                    bool isActive = Convert.ToBoolean(dr["IsActive"]);
                    string email = dr["Username"].ToString();

                    if (!isVerified)
                        return Content("Account not verified");

                    if (!isActive)
                        return Content("Account disabled");

                    Session["user"] = email;
                    if (email == "admin@gmail.com")
                        return RedirectToAction("Users");

                    return RedirectToAction("Details");
                }

                return Content("Invalid Username/Password");
            }
        }

        public ActionResult Details()
        {
            string username = Session["user"]?.ToString();

            User u = new User();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "SELECT * FROM Users WHERE Username=@Username";

                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@Username", username);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    u.Name = dr["Name"].ToString();
                    u.Username = dr["Username"].ToString();
                    u.Language = dr["Language"].ToString();
                    u.Mobile = dr["MobileNumber"].ToString();
                }
            }

            return View(u);
        }

        public ActionResult Users()
        {
            List<User> list = new List<User>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_GetUsers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    list.Add(new User
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Name = dr["Name"].ToString(),
                        Username = dr["Username"].ToString(),
                        IsActive = Convert.ToBoolean(dr["IsActive"]),
                        CreatedDate = Convert.ToDateTime(dr["CreatedDate"])
                    });
                }
            }

            return View(list);
        }

        public ActionResult ToggleUser(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_ToggleUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            return RedirectToAction("Users");
        }
    }
}