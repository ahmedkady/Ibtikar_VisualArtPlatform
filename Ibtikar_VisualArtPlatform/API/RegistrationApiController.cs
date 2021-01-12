using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Umbraco.Core.Services;
using Umbraco.Web.Mvc;
using Umbraco.Web.WebApi;

namespace Ibtikar_VisualArtPlatform.API
{
    public class RegistrationApiController : UmbracoApiController
    {
        private IMemberService _memberService;

        public RegistrationApiController()
        {
            _memberService = Services.MemberService;
        }
 
        [System.Web.Http.HttpGet]
        public ActionResult ActivateMember(string activationCode)
        {
            if (string.IsNullOrEmpty(activationCode))
            {
                return new HttpNotFoundResult();
            }
            int ContentPageId = int.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["ContentPage:Login"]);
            var Member = _memberService.GetMembersByPropertyValue("activationCode", activationCode).FirstOrDefault();
            Member.IsApproved = true;
            _memberService.Save(Member);
            return new RedirectToUmbracoPageResult(ContentPageId);
        }
    }

}