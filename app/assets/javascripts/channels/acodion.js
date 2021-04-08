$(function() {
  $(".sfa .sfa-ttl").on("click", function() {
    $(this).next().slideToggle();
    $(this).toggleClass("active");
  });
});