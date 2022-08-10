using Microsoft.AspNetCore.Identity;
using SmartSolutionTask.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Models;

namespace SmartSolutionTask.Data
{
    public class AppDbInitializer
    {  
        public static async Task<IdentityResult> SeedRolesAsync(RoleManager<ApplicationRole> roleManager)
        {
            IdentityResult result = IdentityResult.Failed();

            foreach (string role in SystemRoles.AllRoles)
            {
                if (await roleManager.FindByNameAsync(role) != null) continue;
                result = await roleManager.CreateAsync(new ApplicationRole
                {
                    Name = role
                });
            }
            return result;
        }
    }
}
