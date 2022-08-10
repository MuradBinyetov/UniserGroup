using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Interfaces;
using UniserGroupTask.ViewModels;

namespace UniserGroupTask.Controllers
{
    [Authorize]
    public class AddressController : Controller
    {
        private readonly IUserService _userService;

        public AddressController(IUserService userService)
        {
            _userService = userService;
        }
        [HttpGet]
        public IActionResult Details(string id)
        {
            UserViewModel details = _userService.GetUserAddresses(id);
            return View(details);
        }
    }
}
