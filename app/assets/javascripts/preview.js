$(document.addEventListener("turbolinks:load",function(){
    $('#edit_image').on('change', function (e) {
        var fileset = $(this).val();
        if (fileset === '') {
          $("#tl_img").attr('src', "");
        } else {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#tl_img").attr('src', e.target.result);
          }
          reader.readAsDataURL(e.target.files[0]);
        }
    });
      
}));    