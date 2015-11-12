// window.onload = function() {
function attachMessages(list) {
  $.ajax("/dc_sept2015_rails/messages", {
    success: function(data) {
      populateListWithData(list, data.messages);
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
