document.addEventListener("turbo:load", () => {
  const botonLector = document.getElementById("lector-contextual");

  let lectorActivo = localStorage.getItem("lectorVozActivo") === "true";
  let ultimoTextoLeido = "";
  let voces = [];

  // Actualizar lista de voces disponibles
  function cargarVoces() {
    voces = window.speechSynthesis.getVoices();
  }

  // Cargar voces inicialmente y cuando cambien
  cargarVoces();
  window.speechSynthesis.onvoiceschanged = cargarVoces;

  function leerTexto(texto) {
    if (texto && texto !== ultimoTextoLeido) {
      window.speechSynthesis.cancel(); // detener lectura anterior

      const mensaje = new SpeechSynthesisUtterance(texto);
      mensaje.lang = "es-MX";
      mensaje.rate = 1;
      mensaje.pitch = 1;

      // Buscar voz en español
      const vozEspañol = voces.find(voz => voz.lang.startsWith('es'));
      if (vozEspañol) {
        mensaje.voice = vozEspañol;
      }

      window.speechSynthesis.speak(mensaje);
      ultimoTextoLeido = texto;
    }
  }

  function onMouseOver(event) {
    const texto = event.target.innerText?.trim() || event.target.alt || event.target.title;
    if (texto) {
      leerTexto(texto);
    }
  }

  // Restaurar estado visual y funcional al cargar
  if (lectorActivo) {
    botonLector.classList.add("activo");
    botonLector.querySelector(".text").textContent = "Lector activo";
    document.body.addEventListener("mouseover", onMouseOver);
  } else {
    botonLector.classList.remove("activo");
    botonLector.querySelector(".text").textContent = "Lector de pantalla";
    document.body.removeEventListener("mouseover", onMouseOver);
    window.speechSynthesis.cancel();
    ultimoTextoLeido = "";
  }

  botonLector.addEventListener("click", (e) => {
    e.preventDefault();
    lectorActivo = !lectorActivo;

    if (lectorActivo) {
      botonLector.classList.add("activo");
      botonLector.querySelector(".text").textContent = "Lector activo";
      document.body.addEventListener("mouseover", onMouseOver);
    } else {
      botonLector.classList.remove("activo");
      botonLector.querySelector(".text").textContent = "Lector de pantalla";
      document.body.removeEventListener("mouseover", onMouseOver);
      window.speechSynthesis.cancel();
      ultimoTextoLeido = "";
    }
    localStorage.setItem("lectorVozActivo", lectorActivo);
  });
});