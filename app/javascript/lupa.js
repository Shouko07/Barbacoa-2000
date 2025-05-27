document.addEventListener("turbo:load", () => {
  const toggleBtn = document.getElementById("magnifier-toggle");
  let magnifier = null;
  let isActive = localStorage.getItem("magnifierActive") === "true";

  // Función para crear y mostrar la lupa
  function activateMagnifier() {
    magnifier = new HTMLMagnifier({
      zoom: 2,
      shape: 'circle',
      width: 200,
      height: 200
    });
    magnifier.show();
    toggleBtn.parentElement.classList.add("activo");
    localStorage.setItem("magnifierActive", "true");
    localStorage.setItem("magnifierBtnActivo", "true");
  }

  // Función para ocultar la lupa
  function deactivateMagnifier() {
    if (magnifier) {
      magnifier.hide();
    }
    toggleBtn.parentElement.classList.remove("activo");
    localStorage.setItem("magnifierActive", "false");
    localStorage.setItem("magnifierBtnActivo", "false");
  }

  // Al cargar la página, restaurar estado visual del botón
  if (localStorage.getItem("magnifierBtnActivo") === "true") {
    toggleBtn.parentElement.classList.add("activo");
  } else {
    toggleBtn.parentElement.classList.remove("activo");
  }

  // Al cargar la página, restaurar estado de la lupa
  if (isActive) {
    activateMagnifier();
  }

  toggleBtn.addEventListener("click", (e) => {
    e.preventDefault();
    if (!isActive) {
      activateMagnifier();
    } else {
      deactivateMagnifier();
    }
    isActive = !isActive;
  });
});