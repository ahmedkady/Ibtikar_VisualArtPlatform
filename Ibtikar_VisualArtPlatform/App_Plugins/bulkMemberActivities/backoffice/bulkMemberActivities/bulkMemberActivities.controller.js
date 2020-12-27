angular.module("umbraco").controller("Umbraco.Members.BulkMemberActivities", function ($scope, bulkMemberActivitiesService) {
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

    //function selectAll($event) {
    //    console.log("selectAll", $event);
    //}

    //function isSelectedAll() {
    //    console.log("isSelectedAll");

    //}

    //function clickItem(item) {
    //    console.log("clickItem", item);


    //}

    //function selectItem(selectedItem, $index, $event) {
    //    console.log("selectItem", selectItem, $index, $event);

    //}

    //function isSortDirection(col, direction) {
    //    console.log("isSortDirection", col, direction);

    //}

    //function sort(field, allow, isSystem) {
    //    console.log("sort", field, allow, isSystem);

    //}


    function selectAll() {
       // listViewHelper.selectAllItemsToggle(vm.items, $scope.selection);

    }

    function isSelectedAll() {
        //    return listViewHelper.isSelectedAll($scope.items, $scope.selection);
    }

    function clickItem(item) {
        //listViewHelper.editItem(item);
    }

    function selectItem(item, $index, $event) {
        ///listViewHelper.selectHandler(item, $index, vm.items, $scope.selection, $event);


    }

    function isSortDirection(col, direction) {
        //return listViewHelper.setSortingDirection(col, direction, $scope.options);
    }
    function sort(field, allow, isSystem) {
        //if (allow) {
        //    $scope.options.orderBySystemField = isSystem;
        //    listViewHelper.setSorting(field, allow, $scope.options);
        //    //  $scope.getContent($scope.contentId);
        //}
    }



});