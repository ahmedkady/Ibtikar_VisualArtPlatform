using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Core.Services;
using Umbraco.Web.Models.Trees;
using Umbraco.Web.Mvc;
using Umbraco.Web.WebApi.Filters;
using Constants = Umbraco.Core.Constants;
using Umbraco.Web.Trees;
using System.Collections.Generic;
using System;
using Umbraco.Web.Actions;

namespace Ibtikar_VisualArtPlatform.Trees
{
    [Tree("member", "bulkMemberActivites", TreeTitle = "Bulk Member Activities", TreeGroup = "bulkMemberGroup")]
    public class BulkMemberActivitesController : TreeController
    {
        protected override TreeNodeCollection GetTreeNodes(string id, FormDataCollection queryStrings)
        {
            // check if we're rendering the root node's children
            if (id == Constants.System.Root.ToInvariantString())
            {
                var nodes = new TreeNodeCollection();
                var node = CreateTreeNode("", "-1", queryStrings, "bulkMemberActivites", "icon -presentation", false);
                nodes.Add(node);
                return nodes;
            }

            // this tree doesn't support rendering more than 1 level
            throw new NotSupportedException();
        }
        protected override MenuItemCollection GetMenuForNode(string id, FormDataCollection queryStrings)
        {
            // create a Menu Item Collection to return so people can interact with the nodes in your tree
            var menu = new MenuItemCollection();

            if (id == Constants.System.Root.ToInvariantString())
            {
                // root actions, perhaps users can create new items in this tree, or perhaps it's not a content tree, it might be a read only tree, or each node item might represent something entirely different...
                // add your menu item actions or custom ActionMenuItems
                menu.Items.Add(new CreateChildEntity(Services.TextService));
                // add refresh menu item (note no dialog)
                menu.Items.Add(new RefreshNode(Services.TextService, true));
                return menu;
            }
            // add a delete action to each individual item
            menu.Items.Add<ActionDelete>(Services.TextService, true, opensDialog: true);

            return menu;
        }
        protected override TreeNode CreateRootNode(FormDataCollection queryStrings)
        {
            var root = base.CreateRootNode(queryStrings);

            //optionally setting a routepath would allow you to load in a custom UI instead of the usual behaviour for a tree
            root.RoutePath = string.Format("{0}/{1}/{2}", "member", "bulkMemberActivites", "overview");
            // set the icon
            root.Icon = "icon-presentation";
            // set to false for a custom tree with a single node.
            root.HasChildren = false;
            //url for menu
            root.MenuUrl = null;

            return root;

        }
    }
}