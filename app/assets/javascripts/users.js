(function($) {

    $('.best_in_place').bind("ajax:success", function () {
        console.log('tuuu');
        $(this).closest('tr').effect('highlight');
    });

})(jQuery);
