var my_elnode_editor = (function () {
    var self = {
        /** Get the text from Emacs.
                       */
        get_text: function () {
            $.ajax("/text/", {
                dataType: "text",
                success: function (data, textStatus, jqXHR) {
                    $("#text").text(data);
                }
            });
        }
    };
    return self;
})();

$(document).ready(
    function () {
        my_elnode_editor.get_text();
    }
);
