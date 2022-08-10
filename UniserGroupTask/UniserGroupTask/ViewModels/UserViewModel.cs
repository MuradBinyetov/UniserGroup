using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Models;

namespace UniserGroupTask.ViewModels
{
    public class UserViewModel
    {
        [Required(ErrorMessage = "İstfadəçinin adını daxil edin")]
        [DataType(DataType.Text)]
        [StringLength(50, ErrorMessage = "Ad düzgün daxil edin", MinimumLength = 2)]
        public string Name { get; set; }

        [Required(ErrorMessage = "İstfadəçinin soyadını daxil edin")]
        [DataType(DataType.Text)]
        [StringLength(50, ErrorMessage = "Soyad düzgün daxil edin", MinimumLength = 2)]
        public string Surname { get; set; }

        [EmailAddress(ErrorMessage = "Elektron ünvan formatı səhvdir")]
        public string Email { get; set; }

        [StringLength(255, ErrorMessage = "Şifrənin uzunluğu 6-255 simvol arasında olmalıdır", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Şifrəni daxil edin")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Login daxil edin")]
        [MinLength(4, ErrorMessage = "Login minimum uzunluğu 4 simvol olmalıdır")]
        [MaxLength(50, ErrorMessage = "Login maksimum uzunluğu 50 simvol olmalıdır")]
        [DataType(DataType.Text)]
        public string Username { get; set; }

        public List<string> UserAddresses { get; set; }
        public IList<ApplicationUser> AllUsers { get; set; }
        public ApplicationUser UserDetails { get; set; }
    }
}
