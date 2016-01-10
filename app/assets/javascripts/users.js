(function($) {

    $(document).ready(function() {
        /* Activating Best In Place */
        jQuery(".best_in_place").best_in_place();
    });

    $(document).bind("ajax:success", function (data, status, xhr) {
        console.log(data.target.id);
        // TODO: add effect after successful update
    });

})(jQuery);
