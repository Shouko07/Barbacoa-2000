document.addEventListener("turbo:load", () => {
  const botonResaltar = document.getElementById("resaltar-links");

  // Función para aplicar o quitar clase a todos los enlaces
  function toggleResaltado(activar) {
    const links = document.querySelectorAll("a");
    links.forEach(link => {
      if (activar) {
        link.classList.add("link-resaltado");
      } else {
        link.classList.remove("link-resaltado");
      }
    });
  }

  // Leer estado guardado
  let resaltadoActivo = localStorage.getItem("resaltadoEnlaces") === "true";

  // Aplicar estado guardado al cargar la página
  toggleResaltado(resaltadoActivo);

  // Evento del botón
  botonResaltar.addEventListener("click", (e) => {
    e.preventDefault();
    resaltadoActivo = !resaltadoActivo;
    localStorage.setItem("resaltadoEnlaces", resaltadoActivo);
    botonResaltar.parentElement.classList.toggle("activo");
    toggleResaltado(resaltadoActivo);
  });
});
