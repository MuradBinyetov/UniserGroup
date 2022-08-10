using ATIS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SmartSolutionTask.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using UniserGroupTask.Interfaces;
using UniserGroupTask.Models;
using UniserGroupTask.ViewModels;
using SignInResult = Microsoft.AspNetCore.Identity.SignInResult;

namespace UniserGroupTask.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IUserService _userService;

        public AccountController(SignInManager<ApplicationUser> signInManager, IUserService userService)
        {
            _signInManager = signInManager;
            _userService = userService;
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login(string returnUrl = "")
        {
            var model = new LoginViewModel { ReturnUrl = returnUrl };
            return View("Login", model);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                ApplicationUser user = await _userService.GetByUsernameAsync(model.Username);
                if (user == null || !_userService.UserCanLogin(model.Username))
                {
                    ModelState.AddModelError("HasNotAccessToLoginErr", "Giriş gadağandır.");
                    return View("Login", model);
                }
                SignInResult result = await _signInManager.PasswordSignInAsync(model.Username, model.Password, false, true);
                if (result.Succeeded)
                {
                    _userService.SetUserLastLoginDate(user.Id);
                    AddUserDataToSession(user);
                    if (!string.IsNullOrEmpty(model.ReturnUrl) && Url.IsLocalUrl(model.ReturnUrl)) return Redirect(model.ReturnUrl); 
                    
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("InvalidUsrOrPwdErr", "Email və ya şifrə yalnışdır.");
                return View(model);
            }
            return View("Login", model);
        }

        [HttpGet]
        public IActionResult Logout(string id)
        {
            return RedirectToAction("Index", "Home");
        } 

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier); 
            HttpContext.Session.Clear();
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login");
        }

        [HttpGet]
        public IActionResult SignUp()
        { 
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SignUp(UserViewModel viewModel)
        {
            bool success = false; 
            if (viewModel == null) viewModel = new UserViewModel(); 

            if (ModelState.IsValid) success = await _userService.AddUserWithRoleAsync(viewModel, SystemRoles.UserRole);

            if (success)
            {
                return RedirectToAction("Login", "Account");
            }
            else
            {
                return View();
            }
        }


        private void AddUserDataToSession(ApplicationUser user)
        {
            if (user == null) throw new ArgumentNullException(nameof(user)); 
            HttpContext.Session.SetString(SessionKey.UserId, user.Id);
            if (!string.IsNullOrEmpty(user.UserName)) HttpContext.Session.SetString(SessionKey.UserLogin, user.UserName);
            if (!string.IsNullOrEmpty(user.Name)) HttpContext.Session.SetString(SessionKey.UserName, user.Name);
            if (!string.IsNullOrEmpty(user.Surname)) HttpContext.Session.SetString(SessionKey.UserSurname, user.Surname);  
              
        }
    }
}
