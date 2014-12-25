$( document ).ready(function() {
  $( document ).on("click",".draft-card", next);
});

var next = function() {
  if (event.target.dataset.pick === "42"){
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
    return;
  }
  // console.log(event.target.dataset.pick)
  event.preventDefault();
  // console.log(event.target.dataset.pick)
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
    $(".pick").text("Currently on pick #"+(response[1]+1))
    $(".draft-box").empty();
    for(var i=0;i<response[0].length;i++){
      render_card(response, response[0][i]);
    }
  })
  .fail(function(response) {
  })
}

var render_card = function(info, card) {
  var pick = info[1] + 1
  var card_id = card.id.toString();
  var pack_id = (info[3].id%24).toString();
  var round_id = (info[2].id%3).toString();
  var draft_id = info[2].draft_id.toString();
  var location = "/drafts/" + draft_id;
  var image_url = card.image_url
  var card_html = "<a href=" + location + ">" +
                  "<img data-card=" + card_id +
                  " data-pack=" + pack_id +
                  " data-round=" + round_id +
                  " data-draft=" + draft_id +
                  " data-pick=" + pick +
                  " class=\"draft-card\" src=" + image_url + " /></a>"
  $(".draft-box").append(card_html);
}

// picks 1-14 = round 1, packs 1-8
// picks 15-28 = round 2, packs 9-16
// picks 29-42 = round 3, packs 17-24

// round = (pick % 14) + 1
// pack  = 8*(round-1) + (pick - 14(round-1))

