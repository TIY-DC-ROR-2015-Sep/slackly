// window.onload = function() {
function insertTag(list) {
  if (list) {
    list.innerHTML = "<li>It works!</li>";
  }
}

window.addEventListener("load", function() {
  var messageList = document.querySelector(".message-list");
  insertTag(messageList);
});
