function update_assignment_container_height() {
    $("#assignment_container").height($(window).height() - (2 * $("#bottom_bar").height()));
}
var assignment_finished = false;
function finish_assignment() {
    $("#bottom_bar .right_item .item-content").removeClass("disabled");
    assignment_finished = true;
}
jQuery(function(){
    update_assignment_container_height();
    $(window).resize(update_assignment_container_height);

    $("#bottom_bar .right_item .item-content a").click(function(){
        if (!assignment_finished) {
            return false;
            }
    })
});

