using System.ComponentModel.DataAnnotations.Schema;

namespace ATIS.Models
{ 
    [NotMapped]
    public static class SessionKey
    { 
       public const string UserId = "UserId";
       public const string UserLogin = "UserLogin";
       public const string UserName = "UserName";
       public const string UserSurname = "UserSurname"; 
    }
}