
$(document).on("ready page:load", function() {

    $("body").on("click", ".card", function(e) {
        if ($(this).hasClass("visible")) {
            return false;
        }
        var card = $(this).children().first(),
            form = $("#next-turn"),
            cardsVisible,
            cardOne,
            cardTwo;

        card.removeClass("invisible");
        card.addClass("visible");

        cardsVisible = $(".visible").length;

        if (cardsVisible === 2) {
            cardOne = $(".visible").first();
            cardTwo = $(".visible").last();
            $("#card_one_id").val(cardOne.data("id"));
            $("#card_two_id").val(cardTwo.data("id"));

            $.rails.handleRemote(form);
        }
    });

});