$( document ).ready(function() {
  $( document ).on("click",".draft-card",next);
});

var next = function() {
  event.preventDefault();
  $.ajax({
    url: event.currentTarget.documentURI+".json",
    type: "PUT",
    data: { draft_id: event.target.dataset.draft,
            round_id: event.target.dataset.round,
            pack_id: event.target.dataset.pack,
            card_id: event.target.dataset.card,
            pick_id: event.target.dataset.pick
    }
  })
  .done(function(response) {
    $(".draft-box").append("<h1>hello</h1>");
    console.log("you done");
    console.log(response);
  })
  .fail(function(response) {
    console.log("you fail");
    console.log(response);
  })
}