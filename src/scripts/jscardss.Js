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
    const promedio = (totalElixir / deck.length).toFixed(1); // Muestra un decimal
    
    document.querySelector(".Promedio").textContent = `Promedio Elixir: ${promedio}`;
}

document.getElementById("btnGenerar").addEventListener("click", async () => {
    const deckIDs = generarNumerosUnicos(NUM_CARDS, MAX_CARD_ID); 
    const fetchedCards = []; 
    
    console.log(`[CLIENT] IDs generados para el mazo: ${deckIDs.join(', ')}`);
    for (let i = 1; i <= NUM_CARDS; i++) {
        const cardElement = document.getElementById(`Card_${i}`);
        if (cardElement) {
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

            if (cartaElemento) {
                cartaElemento.innerHTML = `
                    <div class="d-flex flex-column align-items-center justify-content-center p-1" style="height: 100%;">
                        
                        <img 
                            src="${carta.IMAGE_PATH}" 
                            alt="${carta.NAME}" 
                            class="img-fluid" 
                            style="max-height: 80px; width: auto; margin-bottom: 5px;"
                        >
                        
                        <h6 class="mb-0 text-truncate" style="max-width: 100%; font-size: 0.85rem;">${carta.NAME}</h6>
                        <p class="mb-0 small">Elixir: ${carta.ELIXIR_COST}</p>
                    </div>
                `;
            }
        })
        .catch(error => {
            console.error(`[CLIENT] FALLÓ la carga de ${cardElementId} (ID ${id}):`, error.message);
            if (cartaElemento) {
                 cartaElemento.innerHTML = `<p class="p-2 text-danger small">Error ID ${id}:<br>${error.message.substring(0, 20)}...</p>`;
            }
        });
    });
    await Promise.all(promesasCartas);
    console.log("[CLIENT] Carga del mazo finalizada.");
    actualizarPromedioElixir(fetchedCards);
});