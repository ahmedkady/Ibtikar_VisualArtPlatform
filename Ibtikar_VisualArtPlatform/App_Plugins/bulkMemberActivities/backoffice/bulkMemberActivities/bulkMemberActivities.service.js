angular.module('umbraco.services').factory('bulkMemberActivitiesService', function ($http, umbRequestHelper) {
     
    var service = {
        getMembers: function () { 
            var url = "/umbraco/BulkMemberActivities/Member/GetAllMembers";//umbRequestHelper.getApiUrl("lessonsApiBaseUrl", "GetLessons" + qs);
            return umbRequestHelper.resourcePromise($http.get(url), "Failed to get lessons content")

        }
    };

    return service;

});