using System.Web.Mvc;

namespace tranthihuong_cdtt.Controllers
{
    public class BaseController : Controller
    {
        protected void Alert(string message, bool isError = false)
        {
            if (isError)
            {
                TempData["error"] = message;
            }
            else
            {
                TempData["success"] = message;
            }
        }

        protected JsonResponse GetResponse(bool success, string message = "", object data = null)
        {
            return new JsonResponse
            {
                Success = success,
                Message = message,
                Data = data
            };
        }

        public class JsonResponse
        {
            public bool Success { get; set; }
            public string Message { get; set; }
            public object Data { get; set; }
        }
    }
}