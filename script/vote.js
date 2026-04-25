document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll(".card button");
  const popup = document.querySelector(".acc");
  const teks = document.getElementById("teksPopup");

  buttons.forEach(btn => {
    btn.addEventListener("click", () => {
      const nama = btn.getAttribute("data-nama");
      teks.textContent = "Apakah anda yakin memilih " + nama + "?";
      popup.classList.add("active");
    });
  });

  window.tutupPopup = function(){
    popup.classList.remove("active");
  }
});