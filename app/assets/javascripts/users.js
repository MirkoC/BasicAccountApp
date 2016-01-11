//= require jquery-ui

(function($) {

    $(document).ready(function() {
        /* Activating Best In Place */
        jQuery(".best_in_place").best_in_place();
    });

    $(document).bind("ajax:success", function (data, status, xhr) {
        console.log(data.target.id);
        $("#"+data.target.id).effect( "highlight", {color:"#c9eb86"}, 3000 );
    });

})(jQuery);
