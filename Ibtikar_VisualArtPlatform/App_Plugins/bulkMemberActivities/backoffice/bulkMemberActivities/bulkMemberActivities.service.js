angular.module('umbraco.services').factory('bulkMemberActivitiesService', function ($http, umbRequestHelper) {

    var service = {
        getMembers: function () {
            var url = "/umbraco/BulkMemberActivities/Member/GetAllMembers";
            return umbRequestHelper.resourcePromise($http.get(url), "Failed to get members")
        },

        activateMembers: function (ids) {
            var url = "/umbraco/BulkMemberActivities/Member/ActivateMembers?ids=" + ids.join(',').toString();
            return umbRequestHelper.resourcePromise($http.get(url), "Failed to activate members")
        },

        deactivateMembers: function (ids) {
            var url = "/umbraco/BulkMemberActivities/Member/DeactivateMembers?ids=" + ids.join(',').toString();
            return umbRequestHelper.resourcePromise($http.get(url), "Failed to activate members")
        }
    };

    return service;

});