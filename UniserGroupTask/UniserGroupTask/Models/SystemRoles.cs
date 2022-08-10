using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartSolutionTask.Models
{
    public sealed class SystemRoles
    { 
        public const string UserRole = "User";

        public static readonly IList<string> AllRoles = new List<string>
        {
            UserRole
        };
    }
}
