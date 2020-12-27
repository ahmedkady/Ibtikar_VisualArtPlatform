function isUAENationalityChecked(checkedItem) {
    $("#registration-isUaeCheck").val(checkedItem.checked);
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
function isBasedInUAEChecked(checkedItem) {
    $("#registration-isUaeBasedCheck").val(checkedItem.checked);
    if (checkedItem.checked) {
        $("#Register-schoolsList").show();
    }
    else {
        $("#Register-schoolsList").hide();
    }
}