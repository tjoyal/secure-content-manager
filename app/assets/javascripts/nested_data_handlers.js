// http://railscasts.com/episodes/197-nested-model-form-part-2
// Thanks you Ryan

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");

    var fields = content.replace(regexp, new_id);

    $(link).parent().before(fields);
}