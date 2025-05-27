document.addEventListener("turbo:load", () => {
  const btnAnimaciones = document.getElementById("btn-animaciones");

  if (!btnAnimaciones) return;

  function fijarTransform() {
    document.querySelectorAll("body *").forEach((el) => {
      const style = getComputedStyle(el);
      el.style.transform = style.transform;
    });
  }

  function limpiarTransform() {
    document.querySelectorAll("body *").forEach((el) => {
      el.style.transform = "";
    });
  }

  // Al cargar la página, verifica si ya estaba activado
  if (localStorage.getItem("animacionesReducidas") === "true") {
    document.body.classList.add("animaciones-reducidas");
    fijarTransform();
    // Restaurar el estado visual del botón
    btnAnimaciones.parentElement.classList.add("activo");
  }

  btnAnimaciones.addEventListener("click", (e) => {
    e.preventDefault();
    const activo = document.body.classList.toggle("animaciones-reducidas");
    btnAnimaciones.parentElement.classList.toggle("activo", activo);

    if (activo) {
      fijarTransform();
    } else {
      limpiarTransform();
    }

    localStorage.setItem("animacionesReducidas", activo);
    // Guardar el estado visual del botón
    localStorage.setItem("btnAnimacionesActivo", activo);
  });
});