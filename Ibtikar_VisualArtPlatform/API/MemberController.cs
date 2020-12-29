using Ibtikar_VisualArtPlatform.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
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

        [HttpGet]
        public IEnumerable<MemberViewModel> GetAllMembers()
        {
            var members = memberService.GetAllMembers();

            return members.Select(x => new MemberViewModel()
            {
                Id = x.Id,
                Email = x.Email,
                IsApproved = x.IsApproved,
                Name = x.Name
            });
        }


        [HttpGet]
        public bool ActivateMember(string email)
        {
            var member = memberService.GetByEmail(email);
            member.IsApproved = true;
            memberService.Save(member);
            return true;
        }

        [HttpGet]
        public bool DeactivateMember(string email)
        {
            var member = memberService.GetByEmail(email);
            member.IsApproved = false;
            memberService.Save(member);
            return true;
        }


        [HttpGet]
        public bool ActivateMembers(int[] ids)
        {

            var members = memberService.GetAllMembers(ids);
            foreach (var member in members)
            {
                member.IsApproved = true;
                memberService.Save(member);
            }

            return true;
        }

        [HttpGet]
        public bool DeactivateMembers(int[] ids)
        {

            var members = memberService.GetAllMembers(ids);
            foreach (var member in members)
            {
                member.IsApproved = false;
                memberService.Save(member);
            }

            return true;
        }
    }
}