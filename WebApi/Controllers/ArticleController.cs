using Blog.WebApi.Utility;
using BlogWebApi.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Blog.WebApi.Models;
using Blog.WebApi.Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly ILogger<ArticleController> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public ArticleController(ILogger<ArticleController> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;

            logger.LogInformation("Article Controller ctor completed");
        }

        // GET: api/article?query=xx,fields=a,c
        [HttpGet]
        public async Task<IActionResult> Get(string query, string fields, int? catId, int page = 1, int pageSize = 25)
        {
            Expression<Func<Article, bool>> where;
            
            if (string.IsNullOrEmpty(query))
                where = x => true;
            else
                where = x => x.Title.Contains(query);

            if (catId.HasValue)
                where = where.And(x => x.Categories.Any(x => x.CategoryId == catId));

            var total = 0;

            var select = ExpressionHelper.CreateNewStatement<Article>(fields);

            var list = await _unitOfWork.Repository<Article>().FindAsync(out total, where, select, page, pageSize);

            return Ok(new {
                Total = total,
                Page = page,
                PageSize = pageSize,
                Data = list,
            });
        }

        // GET api/article/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var data = _unitOfWork.Repository<Article>().FirstEntityWithEagerLoad(x => x.Id == id, new string[] { "Categories" });

            return Ok(new { 
                Id = data.Id,
                Body = data.Body,
                Summary = data.Summary,
                Title = data.Title,
                Categories = data.Categories.Select(x=>x.CategoryId),
                TitleImage = data.TitleImage,
            });
        }

        // POST api/article
        [HttpPost()]
        [Authorize]
        public void Post(ArticleCreateOrEditRequest model)
        {
            if (model.Id == 0)
            {
                var article = new Article()
                {
                    Id = model.Id,
                    Title = model.Title,
                    Summary = model.Summary,
                    Body = model.Body,
                    CreatedDate = DateTime.Now,
                    TitleImage = model.TitleImage,
                };

                article.Categories = model.Categories.Select(x => new ArticleToCategory()
                {
                    CategoryId = x
                }).ToList();

                _unitOfWork.Repository<Article>().Insert(article);
            }
            else
            {
                var article = _unitOfWork.Repository<Article>().FirstEntityWithEagerLoad(x => x.Id == model.Id, new string[] { "Categories" });

                article.Title = model.Title;
                article.Summary = model.Summary;
                article.Body = model.Body;
                article.UpdatedDate = DateTime.Now;
                article.TitleImage = model.TitleImage;

                article.Categories = model.Categories.Select(x => new ArticleToCategory()
                {
                    ArticleId = model.Id,
                    CategoryId = x
                }).ToList();

                _unitOfWork.Repository<Article>().Update(article);
            }

            _unitOfWork.Save();
        }

        // DELETE api/article/5
        [HttpDelete("{id}")]
        [Authorize]
        public void Delete(int id)
        {
            _unitOfWork.Repository<Article>().Delete(id);
            _unitOfWork.Save();
        }
    }
}

