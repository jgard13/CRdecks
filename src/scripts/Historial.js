document.addEventListener("DOMContentLoaded", () => {

    const usuarioSpan = document.getElementById("USUARIO");
    const usuarioGuardado = localStorage.getItem("usuario");
    console.log("Valor guardado en localStorage (USUARIO):", usuarioGuardado);

    if (usuarioSpan) {
        if (usuarioGuardado) {
            usuarioSpan.textContent = usuarioGuardado; // Usuario logueado
        } else {
            usuarioSpan.textContent = "No Jala"; 
        }
    }

});

const Generar = document.getElementById("BtnGenerar");
Generar.addEventListener("click", async()=>{
    window.location.href = "/Cards.html"
});

const CerrarSesion = document.getElementById("BotonCerrar");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/index.html";
});

