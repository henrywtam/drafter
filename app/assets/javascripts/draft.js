$( document ).ready(function() {
  $( document ).on("click",".draft-card",next);
});

var next = function() {
  // debugger
  $.ajax({
    dataType: "json",
    url: event.currentTarget.documentURI,
    type: "PATCH",
    data: { card_id: event.target.id }
  })
  .done(function(response) {
    console.log("you done");
    console.log(response);
  })
  .fail(function(response) {
    console.log("you fail");
    console.log(response);
  })
}