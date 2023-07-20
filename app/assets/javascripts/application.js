$(document).on("turbolinks:load", () => {
  $(".ui.dropdown").dropdown();
  $(".message .close").on("click", function () {
    $(this).closest(".message").transition("fade");
  });
  scrollBottom();
  handleForm();
  setTimeout(() => {
    document
      .getElementById("message-bar")
      ?.style.setProperty("display", "none");
  }, 5000);
});

function scrollBottom() {
  const elem = document.getElementById("chat-room");
  if (elem) elem.scrollTop = elem.scrollHeight;
}

function handleForm() {
  document.getElementById("message-form")?.addEventListener("submit", () => {
    setTimeout(() => {
      document.getElementById("message_body").value = "";
    }, 0);
  });
}

function handle() {
  const senderNameElem = document.getElementsByClassName("msg-info-name");
  const senderElem = document.getElementsByClassName("msg");
  const senderName = senderNameElem[senderNameElem.length - 1].innerText;
  const currentUser = document.getElementById("current-user").innerText;
  if (senderName != currentUser)
    senderElem[senderElem.length - 1].setAttribute("id", "left-msg");
}
