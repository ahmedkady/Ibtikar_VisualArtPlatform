using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ibtikar_VisualArtPlatform.ViewModels
{
    public class TeacherRegistrationViewModel : RegistraionViewModel
    {
        public string School { get; set; }
        public bool IsBasedInUae { get; set; }
    }
}