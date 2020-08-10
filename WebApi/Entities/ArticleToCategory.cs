namespace Blog.WebApi.Entities
{
    public class ArticleToCategory
    {
        public int ArticleId { get; set; }
        public virtual Article Article { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
    }
}
