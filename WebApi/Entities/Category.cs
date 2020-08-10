using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Blog.WebApi.Entities
{
    public class Category
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        public int? ParentId { get; set; }

        public virtual Category Parent { get; set; }

        public virtual ICollection<Category> Children { get; set; }
        public virtual ICollection<ArticleToCategory> Articles { get; set; }
    }
   
}
