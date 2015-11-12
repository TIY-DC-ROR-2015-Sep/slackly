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
  messages.forEach(function(m) {
    list.innerHTML += "<li>" + m.text + "</li>"
  })
}

window.addEventListener("load", function() {
  var messageList = document.querySelector(".message-list");
  if (messageList) {
    attachMessages(messageList);
  }
});
