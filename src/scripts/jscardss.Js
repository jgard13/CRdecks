    function generarNumerosUnicos(cantidad, max) {
      const numeros = new Set();
      while (numeros.size < cantidad) {
        numeros.add(Math.floor(Math.random() * max) + 1);
      }
      return Array.from(numeros);
    }
    document.getElementById("btnGenerar").addEventListener("click", () => {
      const cartas = document.querySelectorAll(".carta");
      const numeros = generarNumerosUnicos(8, 109);
      cartas.forEach((carta, i) => {
        carta.textContent = `Carta ${numeros[i]}`;
      });
    });