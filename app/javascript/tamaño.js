document.addEventListener("turbo:load", () => {
  const btnAumentar = document.getElementById("aumentar-texto");
  const btnDisminuir = document.getElementById("disminuir-texto");

  const target = document.documentElement;
  const originalFontSize = 16;
  const maxFontSize = 35;
  const minFontSize = originalFontSize;

  // Función para aplicar el tamaño
  function aplicarTamanio(size) {
    target.style.fontSize = size + "px";
    localStorage.setItem("tamanoLetra", size);
  }

  // Al cargar la página, aplicar el valor guardado si existe
  const guardado = localStorage.getItem("tamanoLetra");
  if (guardado) {
    aplicarTamanio(parseFloat(guardado));
  } else {
    aplicarTamanio(originalFontSize);
  }

  btnAumentar.addEventListener("click", (e) => {
    e.preventDefault();
    let size = parseFloat(target.style.fontSize);
    if (size < maxFontSize) {
      aplicarTamanio(size + 1);
    }
  });

  btnDisminuir.addEventListener("click", (e) => {
    e.preventDefault();
    let size = parseFloat(target.style.fontSize);
    if (size > minFontSize) {
      aplicarTamanio(size - 1);
    }
  });
});
