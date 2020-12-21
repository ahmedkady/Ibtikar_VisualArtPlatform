function isUAENationalityChecked(checkedItem) {
    if (checkedItem.checked) {
        $("#BasicRegistration-EmiratesList").show();
        $("#BasicRegistration-WorldList").hide();
        return;
    }
    if (!checkedItem.checked) {
        $("#BasicRegistration-EmiratesList").hide();
        $("#BasicRegistration-WorldList").show();
        return;
    }
}