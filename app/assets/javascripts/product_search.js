$(function($) {
  $('#model_select').change(function() {
    $.ajax({
      url: "top_pages/search_model",
      type: "GET",
      data: {model: $(":selected").attr("value") },
      dataType: "html"
    });
    //$("form").submit();
  });
});
