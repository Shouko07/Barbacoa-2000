document.addEventListener("turbo:load", () => {
  const grayscaleBtn = document.getElementById("grayscale-toggle-btn");
  const body = document.querySelector('html');

  // Restaurar estado al cargar
  if (localStorage.getItem("grayscaleActivo") === "true") {
    grayscaleBtn.parentElement.classList.add("activo");
    body.classList.add("grayscale");
  } else {
    grayscaleBtn.parentElement.classList.remove("activo");
    body.classList.remove("grayscale");
  }

  grayscaleBtn.addEventListener("click", (e) => {
    e.preventDefault();
    const activo = body.classList.toggle("grayscale");
    grayscaleBtn.parentElement.classList.toggle("activo", activo);
    localStorage.setItem("grayscaleActivo", activo);
  });
});