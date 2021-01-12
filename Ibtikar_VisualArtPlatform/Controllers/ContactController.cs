using Ibtikar_VisualArtPlatform.ViewModels;
using Serilog.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web;
using Umbraco.Web.Mvc;
using Umbraco.Core.Logging;

namespace Ibtikar_VisualArtPlatform.Controllers
{
    public class ContactController : SurfaceController
    {
        private ILogger _Logger;

        public ContactController(ILogger logger)
        {
            _Logger = logger;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitContactForm(ContactUsFormViewModel form)
        {
            string Content = string.Empty;
            if (!ModelState.IsValid)
            {
                TempData["ResultMessage"] = Umbraco.GetDictionaryValue("EnterAllRequiredFields");
                return CurrentUmbracoPage();

            }
            if (this.SendEmail(form))
            {
                Content = Umbraco.Content(1055).Value<string>("successMessage");
            }
            else
            {
                Content = Umbraco.Content(2220).Value<string>("errorMessage");
            }
            TempData["ResultMessage"] = Content;

            return CurrentUmbracoPage();
        }
        public bool SendEmail(ContactUsFormViewModel model)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient client = new SmtpClient();

                string toAddress = System.Web.Configuration.WebConfigurationManager.AppSettings["ContactEmailTo"];
                string fromAddress = System.Web.Configuration.WebConfigurationManager.AppSettings["ContactEmailFrom"];
                message.Subject = string.Format("Enquiry from: {0} - {1}", model.Name, model.Email);
                message.Body = model.Message;
                message.To.Add(new MailAddress(toAddress, toAddress));
                message.From = new MailAddress(fromAddress, fromAddress);

                client.Send(message);
                return true;
            }
            catch (System.Exception ex)
            {
                _Logger.Error(MethodBase.GetCurrentMethod().DeclaringType, "Contact Form Error", ex);
                return false;
            }
        }
    }
}