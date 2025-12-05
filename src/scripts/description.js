document.addEventListener("DOMContentLoaded", () => {

    const usuarioSpan = document.getElementById("USUARIo");
    const usuarioGuardado = localStorage.getItem("usuario");

    if (usuarioSpan) {
        if (usuarioGuardado) {
            usuarioSpan.textContent = usuarioGuardado; // Usuario logueado
        } else {
            usuarioSpan.textContent = "No Jala"; 
        }
    }

});

const CerrarSesion = document.getElementById("BotonCerrar");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/index.html";
});
const GenerarMazos = document.getElementById("btnGenerar");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/Cards.html";
});
const Historial = document.getElementById("btnHistorial");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/index.html";
});