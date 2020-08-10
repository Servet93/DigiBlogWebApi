using Blog.WebApi.Entities;
using Blog.WebApi.Models.Request;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly ILogger<AuthenticationController> _logger;
        private readonly IConfiguration _configuration;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signinManager;

        public AuthenticationController(ILogger<AuthenticationController> logger, IConfiguration configuration, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signinManager)
        {
            _logger = logger;
            _configuration = configuration;
            _userManager = userManager;
            _signinManager = signinManager;

            logger.LogInformation("Authentication Controller ctor completed");
        }

        // POST api/admin/register
        [HttpPost("register")]
        public async Task<IActionResult> Register(RegistrationRequest request)
        {
            var user = new ApplicationUser()
            {
                UserName = request.UserName,
                Email = request.UserName,
            };

            var result = await _userManager.CreateAsync(user, request.Password);

            if (!result.Succeeded)
            {
                var message = new StringBuilder();
                foreach (var item in result.Errors)
                    message.AppendLine($"Code : {item.Code}, Description : {item.Description}");

                return BadRequest(message.ToString());
            }

            JwtSecurityToken token = GenerateToken(new List<Claim>());

            var refreshToken = GenerateRefreshToken();

            return Ok(new
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                RefreshToken = refreshToken,
                Expiration = token.ValidTo
            });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            var user = await _userManager.FindByEmailAsync(request.UserName);

            //Kullanıcı var yok saldırılarını önlemek için not found dışında rastgele durumlar döndürülebilir.
            if (user == null)
                return NotFound();

            await _signinManager.SignOutAsync();
            var result = await _signinManager.PasswordSignInAsync(user, request.Password, false, false);

            if (!result.Succeeded)
                return BadRequest();

            JwtSecurityToken token = GenerateToken(new List<Claim>());

            var refreshToken = GenerateRefreshToken();

            return Ok(new
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                RefreshToken = refreshToken,
                Expiration = token.ValidTo
            });
        }

        #region
        /// <summary>
        /// JwtSecurityToken Üretir.
        /// </summary>
        /// <param name="claims">Token'da yer alacak claim'lerdir.</param>
        /// <returns>JwtSecurityToken</returns>
        private JwtSecurityToken GenerateToken(List<Claim> claims)
        {
            var jwtSignKey = Encoding.ASCII.GetBytes(_configuration.GetSection("AppSettings:JwtSignKey").Value);
            var key = new SymmetricSecurityKey(jwtSignKey);
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var tokenExpirationSetting = "60";

            if (!int.TryParse(tokenExpirationSetting, out int tokenExpiration))
            {
                tokenExpiration = 60;
            }

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(tokenExpiration),
                signingCredentials: creds
            );
            return token;
        }

        private string GenerateRefreshToken()
        {
            var randomNumber = new byte[24];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
                return Convert.ToBase64String(randomNumber);
            }
        }
        #endregion
    }

}
