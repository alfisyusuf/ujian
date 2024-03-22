// File: script.js

// Definisikan objek untuk menyimpan daftar nama berdasarkan kelas
const namaKelas = {
    kelas_1: ["Nama 1", "Nama 2", "Nama 3"],
    kelas_2: ["Nama 4", "Nama 5", "Nama 6"],
    kelas_3: ["Nama 7", "Nama 8", "Nama 9"]
    // Tambahkan daftar nama untuk kelas lain sesuai kebutuhan
};

// Fungsi untuk mengisi opsi nama berdasarkan kelas yang dipilih
function populateNama() {
    const kelasSelect = document.getElementById("kelas");
    const namaSelect = document.getElementById("nama");
    const selectedKelas = kelasSelect.value;

    // Kosongkan opsi nama terlebih dahulu
    namaSelect.innerHTML = "";

    // Iterasi melalui daftar nama untuk kelas yang dipilih
    namaKelas[selectedKelas].forEach(function(nama) {
        const option = document.createElement("option");
        option.text = nama;
        namaSelect.add(option);
    });
}

// Panggil fungsi populateNama saat halaman dimuat untuk memastikan opsi nama terisi pada awalnya
window.onload = populateNama;

// Panggil fungsi populateNama saat kelas dipilih
document.getElementById("kelas").addEventListener("change", populateNama);
