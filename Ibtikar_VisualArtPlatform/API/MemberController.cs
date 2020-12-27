using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Umbraco.Core.Services;
using Umbraco.Web.Mvc;
using Umbraco.Web.WebApi;

namespace Ibtikar_VisualArtPlatform.API
{
    [PluginController("BulkMemberActivities")]
    public class MemberController : UmbracoApiController
    {
        private readonly IMemberService memberService;

        public MemberController(IMemberService memberService)
        {
            this.memberService = memberService;
        }
        public IEnumerable<string> GetAllMembers()
        {

            var members = memberService.GetAllMembers();

            return members.Select(x => x.Name + "-" + x.IsApproved.ToString());
        }
    }
}