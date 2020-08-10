using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Blog.WebApi.Entities
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Category> Categories { get; set; }
        public DbSet<Article> Articles { get; set; }
        public DbSet<ArticleToCategory> ArticlesToCategories { get; set; }
        public DbSet<NLog> NLogs { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Category>().HasMany(p => p.Children).WithOne(p => p.Parent).HasForeignKey(p => p.ParentId);

            builder.Entity<ArticleToCategory>()
                   .HasKey(ac => new { ac.ArticleId, ac.CategoryId });

            builder.Entity<ArticleToCategory>()
                    .HasKey(ac => new { ac.ArticleId, ac.CategoryId });
            builder.Entity<ArticleToCategory>()
                    .HasOne(ac => ac.Article)
                    .WithMany(ac => ac.Categories)
                    .HasForeignKey(ac => ac.ArticleId);
            builder.Entity<ArticleToCategory>()
                    .HasOne(ac => ac.Category)
                    .WithMany(ac => ac.Articles)
                    .HasForeignKey(ac => ac.CategoryId);
        }
    }
}
