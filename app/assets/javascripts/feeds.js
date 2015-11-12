// window.onload = function() {
function attachFavoriteClickHandlers() {
  var favButtons = document.querySelectorAll(".favorite-btn");
  for (var i = 0; i < favButtons.length; i ++) {
    var btn = favButtons[i];
    btn.addEventListener("click", function(e) {
      e.preventDefault();
      console.log("clicked", this.getAttribute("data-id"));
      // $.ajax("/messages/" + id + "/favorites", {method: "POST", success: ...})
    })
  }
}

function attachMessages(list) {
  $.ajax("/dc_sept2015_rails/messages", {
    success: function(data) {
      populateListWithData(list, data.messages);
      attachFavoriteClickHandlers();
    },
    error: function() { alert("Something went wrong"); }
  })
}

function populateListWithData(list, messages) {
  // list.innerHTML = "<li>It works!</li>";
  var source = document.querySelector("#message-list-entry").innerText
  var template = Handlebars.compile(source);

  messages.forEach(function(m) {
    list.innerHTML += template(m)
  })
}


window.addEventListener("load", function() {
  var messageList = document.querySelector(".message-list");
  if (messageList) {
    setInterval(function() {
      attachMessages(messageList);
    }, 5000)

    attachMessages(messageList);
  }

});
