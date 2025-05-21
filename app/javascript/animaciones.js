document.addEventListener("turbo:load", () => {
  const btnAnimaciones = document.getElementById("btn-animaciones");

  if (!btnAnimaciones) return;

  // Al cargar la página, verifica si ya estaba activado
  if (localStorage.getItem("animacionesReducidas") === "true") {
    document.body.classList.add("animaciones-reducidas");
  }

  btnAnimaciones.addEventListener("click", (e) => {
    e.preventDefault();
    document.body.classList.toggle("animaciones-reducidas");

    const activo = document.body.classList.contains("animaciones-reducidas");
        btnAnimaciones.parentElement.classList.toggle("activo");

    localStorage.setItem("animacionesReducidas", activo);
  });
});
