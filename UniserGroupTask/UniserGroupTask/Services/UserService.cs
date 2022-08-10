using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Data;
using UniserGroupTask.Interfaces;
using UniserGroupTask.Models;
using UniserGroupTask.ViewModels;

namespace UniserGroupTask.Services
{
    public class UserService : IUserService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly AppDbContext _dbContext;
        private readonly RoleManager<ApplicationRole> _roleManager;

        public UserService(UserManager<ApplicationUser> userManager,
            AppDbContext dbContext,
            RoleManager<ApplicationRole> roleManager)
        {
            _dbContext = dbContext;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<bool> AddUserWithRoleAsync(UserViewModel viewModel, string role)
        {
            if (viewModel == null || EmailExists(viewModel.Email) || UserNameExists(viewModel.Username) ||
                string.IsNullOrEmpty(role)) return false;
            bool roleExists = await _roleManager.RoleExistsAsync(role);
            if (!roleExists) return false;

            var user = new ApplicationUser
            {
                Name = viewModel.Name,
                Surname = viewModel.Surname,
                UserName = viewModel.Username,
                Email = viewModel.Email,
                Addresses = new List<Address>()
            }; 

            IdentityResult result = await _userManager.CreateAsync(user, viewModel.Password);
            if (!result.Succeeded) return false;
            ApplicationUser createdUser = await _userManager.FindByNameAsync(user.UserName);
            if (viewModel.UserAddresses != null && viewModel.UserAddresses.Any())
            {
                foreach (var address in viewModel.UserAddresses)
                {
                    Address newAddress = new Address
                    {
                        Name = address
                    };
                    user.Addresses.Add(newAddress);
                }
            }
            IdentityResult roleAddingResult = await _userManager.AddToRoleAsync(createdUser, role);
             
            return roleAddingResult.Succeeded;
        }
        public async Task<ApplicationUser> GetByUsernameAsync(string username)
        {
            if (string.IsNullOrEmpty(username)) return null;
            ApplicationUser user = await _userManager.FindByNameAsync(username);
            return user == null ? null : user;
        }

        public bool UserCanLogin(string username)
        {
            ApplicationUser appUser = _dbContext.Users.SingleOrDefault(user => user.UserName.Equals(username));
            if (appUser == null) return false;
            return !appUser.IsDeleted && appUser.HasAccessToLogin;
        }

        public bool EmailExists(string email)
        {
            if (string.IsNullOrEmpty(email)) return false;
            return _dbContext.Users.SingleOrDefault(u => u.Email.Equals(email)) != null;
        }

        public bool UserNameExists(string login)
        {
            if (string.IsNullOrEmpty(login)) return false;
            return _dbContext.Users.SingleOrDefault(u => u.UserName.Equals(login)) != null;
        }

        public UserViewModel GetAllUsers()
        {
            List<ApplicationUser> users = _dbContext.Users 
               .Select(user => new ApplicationUser
               {
                   Id = user.Id,
                   Name = user.Name,
                   Surname = user.Surname,
                   UserName = user.UserName,
                   Email = user.Email,
                   HasAccessToLogin = user.HasAccessToLogin
               }).ToList();

            UserViewModel userViewModel = new UserViewModel
            {
                AllUsers = users
            };
            return userViewModel;
        }

        public void SetUserLastLoginDate(string userId)
        {
            if (string.IsNullOrEmpty(userId)) return;
            ApplicationUser appUser = _dbContext.Users.FirstOrDefault(user => user.Id.Equals(userId));
            if (appUser == null) return;

            appUser.LastLoginDate = DateTime.Now;
            _dbContext.Users.Update(appUser);
            _dbContext.SaveChanges();
        }

        public UserViewModel GetUserAddresses(string userId)
        {
            var userDetails = _dbContext.Users.Include(u=>u.Addresses).FirstOrDefault(u => u.Id == userId);
            UserViewModel viewModel = new UserViewModel
            {
                UserDetails = userDetails
            };
            return viewModel;
        }
    }
}
