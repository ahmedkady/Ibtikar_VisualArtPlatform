//------------------------------------------------------------------------------
// <auto-generated>
//   This code was generated by a tool.
//
//    Umbraco.ModelsBuilder.Embedded v8.9.1
//
//   Changes to this file will be lost if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web;
using Umbraco.Core.Models;
using Umbraco.Core.Models.PublishedContent;
using Umbraco.Web;
using Umbraco.ModelsBuilder.Embedded;

namespace Umbraco.Web.PublishedModels
{
	/// <summary>Spectator Registration</summary>
	[PublishedModel("spectatorRegistration")]
	public partial class SpectatorRegistration : PublishedContentModel, IBasicRegistrationControls, IHeaderControls
	{
		// helpers
#pragma warning disable 0109 // new is redundant
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		public new const string ModelTypeAlias = "spectatorRegistration";
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		public new const PublishedItemType ModelItemType = PublishedItemType.Content;
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		public new static IPublishedContentType GetModelContentType()
			=> PublishedModelUtility.GetModelContentType(ModelItemType, ModelTypeAlias);
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		public static IPublishedPropertyType GetModelPropertyType<TValue>(Expression<Func<SpectatorRegistration, TValue>> selector)
			=> PublishedModelUtility.GetModelPropertyType(GetModelContentType(), selector);
#pragma warning restore 0109

		// ctor
		public SpectatorRegistration(IPublishedContent content)
			: base(content)
		{ }

		// properties

		///<summary>
		/// Age
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("age")]
		public string Age => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetAge(this);

		///<summary>
		/// Education
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("education")]
		public string Education => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetEducation(this);

		///<summary>
		/// Email
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("email")]
		public string Email => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetEmail(this);

		///<summary>
		/// Full name
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("fullName")]
		public string FullName => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetFullName(this);

		///<summary>
		/// Gender
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("gender")]
		public string Gender => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetGender(this);

		///<summary>
		/// Is UAE Citizen
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("isUAECitizen")]
		public string IsUaecitizen => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetIsUaecitizen(this);

		///<summary>
		/// Nationality
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("nationality")]
		public string Nationality => global::Umbraco.Web.PublishedModels.BasicRegistrationControls.GetNationality(this);

		///<summary>
		/// Subtitle
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("subtitle")]
		public string Subtitle => global::Umbraco.Web.PublishedModels.HeaderControls.GetSubtitle(this);

		///<summary>
		/// Title: Please Enter Title
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "8.9.1")]
		[ImplementPropertyType("title")]
		public string Title => global::Umbraco.Web.PublishedModels.HeaderControls.GetTitle(this);
	}
}
