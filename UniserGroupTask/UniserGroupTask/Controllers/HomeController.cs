using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SmartSolutionTask.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Interfaces;
using UniserGroupTask.ViewModels;

namespace UniserGroupTask.Controllers
{ 
    public class HomeController : Controller
    {
        private readonly IUserService _userService;

        public HomeController(IUserService userService)
        { 
            _userService = userService;
        }

        [Authorize(Roles = SystemRoles.UserRole)]
        public IActionResult Index()
        {
            UserViewModel userViewModel = _userService.GetAllUsers();
            return View(userViewModel);
        } 
    }
}
