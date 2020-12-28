using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ibtikar_VisualArtPlatform.ViewModels;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Core.Services;

namespace Ibtikar_VisualArtPlatform.Controllers
{
    public class RegistraionController : Umbraco.Web.Mvc.SurfaceController
    {
        private IMemberService _memberService;
        public RegistraionController()
        {
            _memberService = Services.MemberService; 
        }
        [HttpPost]
        public ActionResult RegisterTeacher(TeacherRegistrationViewModel command)
        {
            var member = _memberService.GetByEmail("teacher@itworxedu.com");
            if (!ModelState.IsValid)
            {
                TempData["InvalidModelState"] = "Invalid";
                return RedirectToCurrentUmbracoPage();
            }
            var newMember = _memberService.CreateMemberWithIdentity(command.Email, command.Email, command.Name, "teacher");
            newMember.IsApproved = false;
            newMember.SetValue("Gender", command.Gender);
            newMember.SetValue("Age", command.Age);
            newMember.SetValue("School", command.School);
            if (command.IsUAE)
            {
                newMember.SetValue("Nationality", command.EmiratesNationality);
            }
            else
            {
                newMember.SetValue("Nationality", command.WorldNationality);
            }
            _memberService.Save(newMember);
            _memberService.SavePassword(newMember, command.Password);
            return RedirectToCurrentUmbracoPage();
        }
        [HttpPost]
        public ActionResult RegisterStudent(StudentRegistrationViewModel command)
        {
            if (!ModelState.IsValid)
            {
                TempData["InvalidModelState"] = "Invalid";
                return RedirectToCurrentUmbracoPage();
            }
            var newMember = _memberService.CreateMemberWithIdentity(command.Email, command.Email, command.Name, "Student");
            newMember.IsApproved = false;
            newMember.SetValue("Gender", command.Gender);
            newMember.SetValue("Age", command.Age);
            newMember.SetValue("BIO", command.BIO);
            if (command.IsUAE)
            {
                newMember.SetValue("Nationality", command.EmiratesNationality);
            }
            else
            {
                newMember.SetValue("Nationality", command.WorldNationality);
            }
            if (command.IsBasedInUae)
            {
                newMember.SetValue("School", command.School);
            }
            _memberService.Save(newMember);
            _memberService.SavePassword(newMember, command.Password);
            return RedirectToCurrentUmbracoPage();
        }
        [HttpPost]
        public ActionResult RegisterSpectator(RegistraionViewModel command)
        {
            if (!ModelState.IsValid)
            {
                TempData["InvalidModelState"] = "Invalid";
                return RedirectToCurrentUmbracoPage();
            }
            var newMember = _memberService.CreateMemberWithIdentity(command.Email, command.Email, command.Name, "Spectator");
            newMember.IsApproved = true;
            newMember.SetValue("Gender", command.Gender);
            newMember.SetValue("Age", command.Age);
            newMember.SetValue("Education", command.Education);
            if (command.IsUAE)
            {
                newMember.SetValue("Nationality", command.EmiratesNationality);
            }
            else
            {
                newMember.SetValue("Nationality", command.WorldNationality);
            }
            _memberService.Save(newMember);
            _memberService.SavePassword(newMember, command.Password);

            return RedirectToCurrentUmbracoPage();
        }
    }
}