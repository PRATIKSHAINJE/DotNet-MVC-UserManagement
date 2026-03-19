using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Project3.Controllers
{
    public class UserController : Controller
    {
        [HttpPost]
        public async Task<ActionResult> Fetch(string username)
        {
            var client = new HttpClient();

            var data = new { Username = username };

            var json = JsonConvert.SerializeObject(data);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await client.PostAsync("https://localhost:44336/api/UserApi/Get", content);

            var result = await response.Content.ReadAsStringAsync();

            return Content(result, "application/json");
        }
    }
}