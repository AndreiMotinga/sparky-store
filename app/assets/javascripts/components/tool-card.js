$(document).ready(function(){
  $(".js-hover-card").on({
      mouseenter: function () {
        $(this).addClass("mdl-shadow--8dp")
      },
      mouseleave: function () {
        $(this).removeClass("mdl-shadow--8dp")
      }
  });
})
