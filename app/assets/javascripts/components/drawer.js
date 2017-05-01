$(document).ready(function(){
  $(".mdl-navigation").on("click", ".js-mainmenu__link", function(e) {
    $( $(this).children()[1] ).toggleClass("is-visible")
  });
})
