angular.module("umbraco").controller("Umbraco.Members.BulkMemberActivities", function ($scope) {
    vm = this;
    vm.testnew = "TEst";
    console.log("enterned");
    vm.content = { name : "Test 2" };

    vm.items = [
        {
            "icon": "icon-document",
            "name": "My node 1",
            "published": true,
            "description": "A short description of my node",
            "author": "Author 1"
        },
        {
            "icon": "icon-document",
            "name": "My node 2",
            "published": true,
            "description": "A short description of my node",
            "author": "Author 2"
        }
    ];

    vm.options = {
        includeProperties: [
            { alias: "description", header: "Description" },
            { alias: "author", header: "Author" }
        ]
    };

    vm.selectItem = selectItem;
    vm.clickItem = clickItem;
    vm.selectAll = selectAll;
    vm.isSelectedAll = isSelectedAll;
    vm.isSortDirection = isSortDirection;
    vm.sort = sort;

    function selectAll($event) {
        alert("select all");
    }

    function isSelectedAll() {

    }

    function clickItem(item) {
        alert("click node");
    }

    function selectItem(selectedItem, $index, $event) {
        alert("select node");
    }

    function isSortDirection(col, direction) {

    }

    function sort(field, allow, isSystem) {

    }




});