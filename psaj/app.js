function login() {
  var password = document.getElementById("password").value;

  // Ganti password di bawah dengan password yang diinginkan
  if (password === "bertumbuh") {
    window.location.href = "susulan897.html";
  } else {
    alert("Password salah. Silakan coba lagi.");
  }
}