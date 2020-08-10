using Blog.WebApi.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using NLog;
using System.Text;

namespace Blog.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Policy tanýmlamasýný yaptýðýmýz kýsýmdýr.
            services.AddCors(o => o.AddPolicy("CorsPolicy", builder =>
            {
                //WithOrigins("http://localhost:4200")
                builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
            }));

            services.AddControllers();
            services.AddTransient<IUnitOfWork, UnitOfWork>();

            services.AddDbContext<ApplicationDbContext>(options => {
                options.UseSqlServer(Configuration.GetConnectionString("BloggingDatabase"));
            });
            services.AddIdentity<ApplicationUser, IdentityRole>()
                    .AddEntityFrameworkStores<ApplicationDbContext>()
                    .AddDefaultTokenProviders();
            
            services.AddControllers().AddNewtonsoftJson(options => options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

            var jwtSignKey = Encoding.ASCII.GetBytes(Configuration.GetSection("AppSettings:JwtSignKey").Value);

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    //Token oluþturulurken bu tokený baþkalarý rahat bir þekilde hazýrlayamasýn diye tokena imza atarýz.
                    ValidateIssuerSigningKey = true,
                    //Ýmzaladýðýmýz key bilgisi,
                    IssuerSigningKey = new SymmetricSecurityKey(jwtSignKey),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                };
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            LogManager.Configuration.Variables["ConnectionStrings"] = Configuration.GetConnectionString("BloggingDatabase");
            //loggerFactory.AddNLog();

            app.UseCors("CorsPolicy");//CorsPolicy ismi ile tanýmlanan güvenlik tanýmlamasýný tüm uygulama için geçerli olmasýný saðlamýþ oluyoruz.

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
