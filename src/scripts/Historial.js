document.addEventListener("DOMContentLoaded", async() => {

    const usuarioSpan = document.getElementById("USUARIO");
    const usuarioGuardado = localStorage.getItem("usuario");
    const idGuardada = localStorage.getItem("idUsuario");
    console.log("Valor guardado en localStorage (USUARIO):", usuarioGuardado);

    if (usuarioSpan) {
        if (usuarioGuardado) {
            usuarioSpan.textContent = usuarioGuardado; // Usuario logueado
        } else {
            usuarioSpan.textContent = "No Jala"; 
        }
    }

    await cargarHistorial(idGuardada);
});

const Generar = document.getElementById("BtnGenerar");
Generar.addEventListener("click", async()=>{
    window.location.href = "/Cards.html"
});

const CerrarSesion = document.getElementById("BotonCerrar");
CerrarSesion.addEventListener("click", async() => {
    window.location.href = "/index.html";
});

async function cargarHistorial(userID) {
    try {
        const res = await fetch(`/Mazos/GetByUser/${userID}`);
        const data = await res.json();

        const contenedor = document.getElementById("ContHistorial");
        contenedor.innerHTML = ""; // Limpio todo

        for (const deck of data.decks) {
            await agregarMazoHTML(deck);
        }

    } catch (error) {
        console.error("Error cargando historial:", error);
    }
}
async function agregarMazoHTML(deck) {

    //Obtengo las cartas del mazo
    const res = await fetch(`/Mazos/GetCards/${deck.deck_id}`);
    const data = await res.json();
    const cards = data.cards;
    //Contenedor de el mazo
    const mazoDiv = document.createElement("div");
    mazoDiv.classList.add("MazoHistorial", "d-flex", "align-items-center", "gap-5", "mb-5");

    //Creo el grid de cartas
    let cartasHTML = `
        <div class="d-grid" style="grid-template-columns: repeat(8, 140px); gap: 25px;">
    `;

    cards.forEach((carta, i) => {
        cartasHTML += `
            <div class="card bg-secondary text-center text-white rounded-4" style="height: 180px;">
                <img src="${carta.IMAGE_PATH}" 
                     alt="${carta.NAME}" 
                     class="img-fluid" 
                     style="max-height: 150px; margin-top:10px;"
                     data-url="${carta.Url_Card}"
                     >
            </div>
        `;
    });

    cartasHTML += `</div>`;
    const boton = `
        <button class="btn fw-bold text-white px-4 py-2 rounded-pill CopiarHistorial">
            Copiar Mazo
        </button>
    `;
    //Insertar todo en el div
    mazoDiv.innerHTML = cartasHTML + boton;
    //Insertar al historial
    document.getElementById("ContHistorial").appendChild(mazoDiv);
}

//Copiar mazo por cada uno de los mazos en el historial.
document.addEventListener("click", async (event) => {
    if (event.target.classList.contains("CopiarHistorial")) {

        const mazoDiv = event.target.closest(".MazoHistorial");
        const cartas = mazoDiv.querySelectorAll("img[data-url]");

        const deckArray = [];
        cartas.forEach(img => deckArray.push(img.dataset.url));

        const urlini = "clashroyale://copyDeck?deck=";
        const urlfin = "&tt=159000000&l=Royals";
        const urlFinal = `${urlini}${deckArray.join(";")}${urlfin}`;

        try {
            await navigator.clipboard.writeText(urlFinal);
            alert("¡Mazo copiado al portapapeles!");
        } catch (error) {
            alert("No se pudo copiar.");
        }

        window.location.href = urlFinal;
    }
});

