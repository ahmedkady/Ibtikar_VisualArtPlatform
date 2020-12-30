using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ibtikar_VisualArtPlatform.ViewModels
{
    public class LoginViewModel
    {
        [Display(Name = "Email")]
        [Required]
        public string Username { get; set; }

        [Display(Name = "Password")]
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}