function afterShoutyCreated(html) {
    $(".shouties").prepend(html);
    $("#shouty_body").val('');
}

function updateShoutiesFrom(html) {
    $(".shouties").html(html);
}

function updateShouties() {
    $("#update_shouties").callRemote();
}

function removeShouty(id) {
    $("#shouty_" + id).remove();
}

$(function() {
    setInterval(updateShouties, "30000");
})
