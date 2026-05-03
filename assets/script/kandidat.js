// ================= POPUP PROFILE =================
function openPopup(id) {
  document.getElementById(id).classList.add("active");
}

function closePopup(id) {
  document.getElementById(id).classList.remove("active");
}

// ================= CONFIRM =================
function openConfirm(id_calon) {
  document.getElementById("id_calon").value = id_calon;

  document.getElementById("confirmText").innerText =
    "Apakah anda yakin memilih kandidat ini?";

  document.getElementById("confirmBox").classList.add("active");
}

function closeConfirm() {
  document.getElementById("confirmBox").classList.remove("active");
}