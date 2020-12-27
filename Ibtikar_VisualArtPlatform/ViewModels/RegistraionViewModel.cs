using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ibtikar_VisualArtPlatform.ViewModels
{
    public class RegistraionViewModel
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Age { get; set; }
        public string WorldNationality { get; set; }
        public string EmiratesNationality { get; set; }
        public string Gender { get; set; }
        public string Education { get; set; }
        public bool IsUAE { get; set; }
    }
}