const buttons = document.querySelectorAll(".btn-profile");
const popup = document.getElementById("popup");
const closeBtn = document.querySelector(".close");

const popupImg = document.getElementById("popup-img");
const popupTitle = document.getElementById("popup-title");
const popupDesc = document.getElementById("popup-desc");

buttons.forEach(btn => {
  btn.addEventListener("click", () => {
    popup.style.display = "block";

    popupImg.src = btn.getAttribute("data-img");
    popupTitle.innerText = btn.getAttribute("data-nama");
    popupDesc.innerText = btn.getAttribute("data-desc");
  });
});

closeBtn.addEventListener("click", () => {
  popup.style.display = "none";
});

window.addEventListener("click", (e) => {
  if (e.target == popup) {
    popup.style.display = "none";
  }
});