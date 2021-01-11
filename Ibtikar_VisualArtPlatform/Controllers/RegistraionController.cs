using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Ibtikar_VisualArtPlatform.ViewModels;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Core.Services;
using Umbraco.Core.Logging;
using System.Reflection;

namespace Ibtikar_VisualArtPlatform.Controllers
{
    public class RegistraionController : Umbraco.Web.Mvc.SurfaceController
    {
        private IMemberService _memberService;
        private readonly ILogger logger;

        public RegistraionController(ILogger logger)
        {
            _memberService = Services.MemberService;
            this.logger = logger;
        }

        //[HttpGet]
        //[AllowAnonymous]
        //public ActionResult ActivateMember(string activationcode)
        //{
        //    if (string.IsNullOrEmpty(activationcode))
        //    {
        //        return new HttpNotFoundResult();
        //    }
        //    var Member = _memberService.GetMembersByPropertyValue("activationCode", activationcode).FirstOrDefault();
        //    Member.IsApproved = true;
        //    _memberService.Save(Member);
        //    return RedirectToUmbracoPage(1065);
        //}

        [HttpPost]
        public ActionResult RegisterTeacher(TeacherRegistrationViewModel command)
        {
            string ResumePath = string.Empty;
            if (!ModelState.IsValid)
            {
                TempData["InvalidModelState"] = "Invalid";
                return RedirectToCurrentUmbracoPage();
            }
            if (Request.Files.Count > 0)
            {
                var CV = Request.Files[0];
                string FileName = Guid.NewGuid().ToString() + CV.FileName;
                IMedia media = Services.MediaService.CreateMediaWithIdentity(FileName, 1105, Constants.Conventions.MediaTypes.File);
                media.SetValue(Services.ContentTypeBaseServices, Constants.Conventions.Media.File, FileName, CV.InputStream);
                Services.MediaService.Save(media);
                IMedia SavedFile = Services.MediaService.GetById(media.Id);
                ResumePath = SavedFile.GetValue<string>(Constants.Conventions.Media.File);
            }
            string ActivationCode = Guid.NewGuid().ToString();
            var newMember = _memberService.CreateMemberWithIdentity(command.Email, command.Email, command.Name, "teacher");
            newMember.IsApproved = false;
            newMember.SetValue("CV", ResumePath);
            //newMember.set
            newMember.SetValue("activationCode", ActivationCode);
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
            this.SendActivationMail(ActivationCode, newMember.Email);
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
            string ActivationCode = Guid.NewGuid().ToString();
            newMember.SetValue("activationCode", ActivationCode);
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
        public bool SendActivationMail(string ActivationCode, string MemberEmail)
        {
            try
            {
                string ActivationLink = Request.Url.Scheme + "://" + Request.Url.Authority + "/umbraco/api/RegistrationApi/ActivateMember?activationCode=" + ActivationCode;
                string body = "<br/><br/>We are excited to tell you that your account is" +
     " successfully created. Please click the button below on the below link to verify your account" +
     " <br/><br/><a href='" + ActivationLink + "'>Activate </a> ";
                MailMessage message = new MailMessage();
                SmtpClient client = new SmtpClient();

                string fromAddress = System.Web.Configuration.WebConfigurationManager.AppSettings["ActivationFromMail"];
                message.Subject = "Visual arts activation mail";
                message.Body = body;
                message.To.Add(new MailAddress(MemberEmail, MemberEmail));
                message.From = new MailAddress(fromAddress, fromAddress);
                message.IsBodyHtml = true;

                client.Send(message);
                return true;
            }
            catch (System.Exception ex)
            {
                Logger.Error(MethodBase.GetCurrentMethod().DeclaringType, "activation mail Error", ex);
                return false;
            }
        }

    }
}