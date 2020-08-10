using Blog.WebApi.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BlogWBlog.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ILogger<CategoryController> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public CategoryController(ILogger<CategoryController> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;

            logger.LogInformation("Category Controller ctor completed");
        }

        // GET: api/category
        [HttpGet]
        public IActionResult Get()
        {
            return new JsonResult(_unitOfWork.Repository<Category>().Select());
        }

        // GET api/category/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return new JsonResult(_unitOfWork.Repository<Category>().Select(x=> x.Id == id));
        }

        // POST api/<category>
        [HttpPost("{name}/{parentId?}")]
        [Authorize]
        public void Post(string name, int? parentId)
        {
            _unitOfWork.Repository<Category>().Insert(new Category() { Name = name, ParentId = parentId });
            _unitOfWork.Save();
        }

        // PUT api/<CategoryController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<category>/5
        [HttpDelete("{id}")]
        [Authorize]
        public void Delete(int id)
        {
            _unitOfWork.Repository<Category>().Delete(id);
            _unitOfWork.Save();
        }
    }
}
