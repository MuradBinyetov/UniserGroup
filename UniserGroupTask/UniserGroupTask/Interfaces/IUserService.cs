using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Models;
using UniserGroupTask.ViewModels;

namespace UniserGroupTask.Interfaces
{
    public interface IUserService
    {
        Task<ApplicationUser> GetByUsernameAsync(string username);
        bool UserCanLogin(string username);
        Task<bool> AddUserWithRoleAsync(UserViewModel viewModel, string role);
        UserViewModel GetAllUsers();
        UserViewModel GetUserAddresses(string userId);
        void SetUserLastLoginDate(string userId);

    }
}
