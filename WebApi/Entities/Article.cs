using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Blog.WebApi.Entities
{
    public class Article
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        public string Summary { get; set; }

        public string TitleImage { get; set; }

        public string Body { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public virtual ICollection<ArticleToCategory> Categories { get; set; }
    }

}
