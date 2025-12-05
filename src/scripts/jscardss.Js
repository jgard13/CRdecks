const MAX_CARD_ID = 121; 
const NUM_CARDS = 8;

/**
 * Genera una lista de IDs únicos dentro del rango [1, max].
 * @returns {number[]}
 */
function generarNumerosUnicos(cantidad, max) {
    const numeros = new Set();
    while (numeros.size < cantidad) {
        numeros.add(Math.floor(Math.random() * max) + 1); 
    }
    return Array.from(numeros);
}

/**
 * Calcula y muestra el promedio de Elixir de las cartas en el mazo.
 * @param {Object[]} deck - Array de objetos de cartas.
 */
function actualizarPromedioElixir(deck) {
    if (deck.length === 0) {
        document.querySelector(".Promedio").textContent = "Promedio Elixir: 0";
        return;
    }
    const totalElixir = deck.reduce((sum, card) => sum + card.ELIXIR_COST, 0);
    const promedio = (totalElixir / deck.length).toFixed(1);
    
    document.querySelector(".Promedio").innerHTML = `Promedio Elixir:<br><br><img src="/img/FondosIconos/Elixir.webp" style="height: 35px; width: auto">${promedio}`;
}

document.getElementById("btnGenerar").addEventListener("click", async () => {
    const deckIDs = generarNumerosUnicos(NUM_CARDS, MAX_CARD_ID); 
    const fetchedCards = []; 
    
    console.log(`[CLIENT] IDs generados para el mazo: ${deckIDs.join(', ')}`);
    for (let i = 1; i <= NUM_CARDS; i++) {
        const cardElement = document.getElementById(`Card_${i}`);
        if (cardElement) {
             cardElement.classList.remove('bg-primary');
             cardElement.classList.add('bg-secondary');
             cardElement.innerHTML = `<div class="d-flex justify-content-center align-items-center" style="height: 100%;"><div class="spinner-border text-white" role="status"><span class="visually-hidden">Cargando...</span></div></div>`;
        }
    }
    const promesasCartas = deckIDs.map((id, index) => {
        const cardElementId = `Card_${index + 1}`; 
        const cartaElemento = document.getElementById(cardElementId);
        
        return fetch('/Cards/GetByID', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ ID: id }) 
        })
        .then(response => {
            if (!response.ok) {
                return response.json().then(errorData => {
                    throw new Error(`Error ${response.status}: ${errorData.message}`);
                });
            }
            return response.json(); 
        })
        .then(data => {
            const carta = data.card;
            
            console.log(`[CLIENT] Recibido OK para ${cardElementId}: ${carta.NAME}`);
            fetchedCards.push(carta); 
            let finalImagePath = carta.IMAGE_PATH;
            let isEvolved = false;
            if (carta.HAS_EVOLUTION === 1 && (index === 0 || index === 1)) {
                if (carta.EVOLUTION_IMAGE_PATH) {
                    finalImagePath = carta.EVOLUTION_IMAGE_PATH;
                    isEvolved = true;
                    console.log(`[CLIENT] Carta en posición ${index + 1} (${carta.NAME}) es EVOLUCIONADA.`);
                }
            }

            if (cartaElemento) {
                cartaElemento.classList.toggle('bg-primary', isEvolved);
                cartaElemento.classList.toggle('bg-secondary', !isEvolved);
                cartaElemento.innerHTML = `
                    <div class="d-flex flex-column align-items-center justify-content-center p-1" style="height: 100%;">
                        
                        <img 
                            src="${finalImagePath}" 
                            alt="${carta.NAME}" 
                            class="img-fluid Imagen" 
                            style="max-height: 200px; width: auto; margin-bottom: 5px; ${isEvolved ? 'border: 3px solid #6c5ce7; border-radius: 10px;' : ''}"
                        >
                        
                        ${isEvolved ? '<span class="badge bg-info" style="font-size: 0.6rem;">EVO</span>' : ''}
                    </div>
                `;
            }
        })
        .catch(error => {
            console.error(`[CLIENT] FALLÓ la carga de ${cardElementId} (ID ${id}):`, error.message);
            if (cartaElemento) {
                 cartaElemento.classList.remove('bg-primary');
                 cartaElemento.classList.add('bg-secondary');
                 cartaElemento.innerHTML = `<p class="p-2 text-danger small">Error ID ${id}:<br>${error.message.substring(0, 20)}...</p>`;
            }
        });
    });
    await Promise.all(promesasCartas);
    console.log("[CLIENT] Carga del mazo finalizada.");

    actualizarPromedioElixir(fetchedCards);

    //Guardar el mazo para el servidor
    try{
        const idGuardada = localStorage.getItem("idUsuario");
        const promedioElixir = parseFloat(
            (fetchedCards.reduce((a,b) => a + b.ELIXIR_COST, 0) / fetchedCards.length).toFixed(1)
        );

        const response = await fetch('/Mazos/GuardarMazo', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                userID: idGuardada,
                deck: fetchedCards,
                promedioElixir: promedioElixir
            })
        });

        const data = await response.json();

    }catch(error){
        console.error("No se pudo guardar el mazo:", error);
    }
});


//Cuando carga la pagina modifica donde esta el usuario a traves de la ID
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

const Historial = document.getElementById("BtnHistorial");
Historial.addEventListener("click", async() =>{
    window.location.href = "/Historial.html";
});

const CerrarSesion = document.getElementById("BotonCerrar");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/index.html";
});