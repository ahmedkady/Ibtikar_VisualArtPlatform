angular.module("umbraco").controller("Umbraco.Members.BulkMemberActivities", function ($scope, bulkMemberActivitiesService, listViewHelper) {
    vm = this;
    vm.members = [];
    vm.filterText = "";

    loadMembers();

    // methods

    function loadMembers() {
        bulkMemberActivitiesService.getMembers()
            .then(function (data) {
                vm.members = data;
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

    $scope.toggleSelection = function (member) {
        member.isSelected = !member.isSelected;
    }

    $scope.getSelectedCount = function () {
        return vm.members.filter((m) => m.isSelected).length;
    }
});