using Microsoft.AspNetCore.Mvc;

namespace NewTaskBackEnd.Controllers
{
    public class About : Controller
    {
        public string Index()
        {
            return "About us";
        }
    }
}
