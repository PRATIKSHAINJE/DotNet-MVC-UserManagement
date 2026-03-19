using Project.Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Project.Controllers
{
    [EnableCors(origins: "https://localhost:44383", headers: "*", methods: "*")]
    public class UserApiController : ApiController   
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

      
        
            [HttpPost]
            public IHttpActionResult Get(User req)
            {
                var data = new
                {
                    Name = "Test",
                    Username = req.Username
                };

                var response = Ok(data);

                // 🔥 FORCE HEADER (this will 100% fix)
                System.Web.HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");

                return response;
            }
        
        [HttpOptions]
        public IHttpActionResult Options()
        {
            return Ok();
        }
    }
}