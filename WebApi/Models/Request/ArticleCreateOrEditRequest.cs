using System.Collections.Generic;

namespace Blog.WebApi.Models
{
    public class ArticleCreateOrEditRequest
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Summary { get; set; }

        public string TitleImage { get; set; }

        public string Body { get; set; }

        public virtual ICollection<int> Categories { get; set; }
    }
}
