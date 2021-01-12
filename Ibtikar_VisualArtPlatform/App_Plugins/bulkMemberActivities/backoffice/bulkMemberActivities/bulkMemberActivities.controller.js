var app = angular.module("umbraco");
app.requires.push('angularUtils.directives.dirPagination');
app.controller("Umbraco.Members.BulkMemberActivities", function ($scope, bulkMemberActivitiesService, notificationsService) {
    vm = this;
    vm.members = [];
    vm.filterText = "";
    vm.isLoading = true;
    vm.currentPage = 1;

    // on init methods
    loadMembers();

    // methods
    function loadMembers() {
        bulkMemberActivitiesService.getMembers()
            .then(function (data) {
                vm.members = data;
                vm.isLoading = false;
            });
    }

    $scope.selectAll = function () {
        if (vm.members.filter((m) => m.isSelected).length < vm.members.length) {
            angular.forEach(vm.members, function (value, key) {
                value.isSelected = true;
            });
        } else {
            angular.forEach(vm.members, function (value, key) {
                value.isSelected = false;
            });
        }
    }

    $scope.clearSelection = function () {
        angular.forEach(vm.members, function (value, key) {
            value.isSelected = false;
        });
    }

    $scope.toggleSelection = function (member) {
        member.isSelected = !member.isSelected;
    }

    $scope.getSelectedCount = function () {
        return vm.members.filter((m) => m.isSelected).length;
    }

    $scope.activateMembers = function () {
        vm.isLoading = true;
        bulkMemberActivitiesService.activateMembers(vm.members.filter((m) => m.isSelected).map(m => m.Id))
            .then(function () {
                loadMembers();
                notificationsService.success("Members Activated Successfully", "Success!");
                vm.isLoading = false;
            });
    }

    $scope.deactivateMembers = function () {
        vm.isLoading = true;
        bulkMemberActivitiesService.deactivateMembers(vm.members.filter((m) => m.isSelected).map(m => m.Id))
            .then(function () {
                loadMembers();
                notificationsService.success("Members Deactivated Successfully", "Success!");
                vm.isLoading = false;
            });
    }

    $scope.pageChangeHandler = function (num) {
        vm.currentPage = num;
        //console.log('meals page changed to ' + num);
    };
});