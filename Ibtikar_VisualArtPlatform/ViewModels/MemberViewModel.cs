﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ibtikar_VisualArtPlatform.ViewModels
{
    public class MemberViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public bool IsApproved { get; set; }
    }
}