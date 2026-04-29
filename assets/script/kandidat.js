// ================= POPUP PROFIL =================
function openPopup(id) {
  const popup = document.getElementById(id);
  if (popup) {
    popup.classList.add("active");
  } else {
    console.error("Popup tidak ditemukan:", id);
  }
}

function closePopup(id) {
  const popup = document.getElementById(id);
  if (popup) {
    popup.classList.remove("active");
  }
}

// ================= POPUP KONFIRMASI =================
let kandidatDipilih = "";

function openConfirm(nama) {
  kandidatDipilih = nama;

  const text = document.getElementById("confirmText");
  const popup = document.getElementById("confirmPopup");

  if (text && popup) {
    text.innerText = "Apakah anda yakin memilih " + nama + "?";
    popup.classList.add("active");
  } else {
    console.error("Element konfirmasi tidak ditemukan");
  }
}

function closeConfirm() {
  const popup = document.getElementById("confirmPopup");
  if (popup) {
    popup.classList.remove("active");
  }
}

// ================= AKSI PILIH =================
function pilihSekarang() {
  if (kandidatDipilih === "") {
    alert("Belum ada kandidat dipilih");
    return;
  }

  alert("Kamu memilih: " + kandidatDipilih);

  // TODO: kirim ke database (AJAX / fetch)
  closeConfirm();
}