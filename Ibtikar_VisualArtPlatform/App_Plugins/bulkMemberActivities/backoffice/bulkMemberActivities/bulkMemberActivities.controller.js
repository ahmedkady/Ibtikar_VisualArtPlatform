angular.module("umbraco").controller("Umbraco.Members.BulkMemberActivities", function ($scope, bulkMemberActivitiesService, listViewHelper ) {
    vm = this;
    vm.testnew = "TEst";
    console.log("enterned");
    vm.content = { name: "Test 2" };
    bulkMemberActivitiesService.getMembers()
        .then(function (data) {

            vm.members = data;
            console.log(vm.members);
        });
    vm.items = [
        {
            "icon": "icon-document",
            "name": "My node 2",
            "published": true,
            "description": "A short description of my node",
            "author": "Author 1"
        },
        {
            "icon": "icon-document",
            "name": "My node 1",
            "published": true,
            "description": "A short description of my node",
            "author": "Author 2"
        }
    ];
        

    vm.options = {
        filter: '',
        orderBy: "name",
        orderDirection: "asc",
        includeProperties: [
            { alias: "author", header: "Author" },
            { alias: "description", header: "description" },
            { alias: "name", header: "name" },
            { alias: "published", header: "published" }
        ],
        bulkActionsAllowed: true
    };


    vm.selection = [];

    vm.selectItem = selectItem;
    vm.clickItem = clickItem;
    vm.selectAll = selectAll;
    vm.isSelectedAll = isSelectedAll;
    vm.isSortDirection = isSortDirection;
    vm.sort = sort;
    vm.allowSelectAll = true;

    function selectAll() {
        console.log("selectAll()");
        listViewHelper.selectAllItemsToggle(vm.items, vm.selection);
    }

    function isSelectedAll() {
        console.log("isSelectedAll()");
        return listViewHelper.isSelectedAll(vm.items, vm.selection);
    }

    function clickItem(item) {
        console.log(item);
        //listViewHelper.editItem(item);
    }

    function selectItem(item, $index, $event) {
        console.log("selectItem", item, $index, $event);
        listViewHelper.selectHandler(item, $index, vm.items, vm.selection, $event);
    }

    function isSortDirection(col, direction) {
        console.log("isSortDirection", col, direction);
        return listViewHelper.setSortingDirection(col, direction, vm.options);
    }

    function sort(field, allow) {
        console.log("sort", field, allow);
        if (allow) {
            listViewHelper.setSorting(field, allow, vm.options);
            //  $scope.getContent($scope.contentId);
        }
    }


});