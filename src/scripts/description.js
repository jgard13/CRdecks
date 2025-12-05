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

document.addEventListener("DOMContentLoaded", () => {
    // 1. Obtener la ID de la carta guardada
    const selectedCardID = localStorage.getItem("selectedCardID");

    if (selectedCardID) {
        console.log(`[Description] Obteniendo datos para la carta ID: ${selectedCardID}`);

        fetch('/Cards/GetByID', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            // Asegúrate de enviar la ID como número
            body: JSON.stringify({ ID: parseInt(selectedCardID, 10) }) 
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('No se pudieron obtener los datos de la carta.');
            }
            return response.json(); 
        })
        .then(data => {
            const carta = data.card;
            const nombreElement = document.getElementById("NombreCarta");
            const elixirElement = document.getElementById("ElixirCost");
            const rarezaElement = document.getElementById("Rareza");
            const descripcionElement = document.getElementById("Description");
            const imagenElement = document.querySelector(".container-fluid img");

            if (nombreElement) {
                nombreElement.textContent = carta.NAME;
            }
            if (elixirElement) {
                elixirElement.textContent = carta.ELIXIR_COST; 
            }
            if (rarezaElement) {
                rarezaElement.textContent = carta.RARITY_NAME || carta.RARITY; 
            }
            if (descripcionElement) {
                descripcionElement.textContent = carta.description; 
            }
            if (imagenElement) {
                imagenElement.src = carta.IMAGE_PATH; 
                imagenElement.alt = carta.NAME;
            }

            console.log(`[Description] Carta '${carta.NAME}' cargada exitosamente.`);
            localStorage.removeItem("selectedCardID");
        })
        .catch(error => {
            console.error("[Description] Error al cargar la carta:", error);
            document.getElementById("NombreCarta").textContent = "Error de Carga";
            document.getElementById("Description").textContent = "No se pudieron obtener los detalles de la carta.";
        });
    } else {
        console.error("[Description] No se encontró la ID de la carta seleccionada.");
        document.getElementById("NombreCarta").textContent = "No se seleccionó ninguna carta";
    }
});