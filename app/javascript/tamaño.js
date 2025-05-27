document.addEventListener("turbo:load", () => {
  const btnAumentar = document.getElementById("aumentar-texto");
  const btnDisminuir = document.getElementById("disminuir-texto");
  const target = document.documentElement;
  const sidebar = document.querySelector('.sidebar');
  const originalFontSize = 16;
  const maxFontSize = 35;
  const minFontSize = originalFontSize;

  function ajustarSidebar(size) {
    if (!sidebar) return;

    if (sidebar.classList.contains('close')) {
      // Sidebar cerrada: ponemos ancho fijo en la variable CSS
      document.documentElement.style.setProperty('--sidebar-width', '88px');

      // Ajustamos .home si existe
      const home = document.querySelector('.home');
      if (home) {
        home.style.left = '88px';
        home.style.width = `calc(100% - 88px)`;
      }
      return;
    }

    // Sidebar abierta: ancho proporcional al tamaño de letra
    const baseFont = 16;
    const baseWidth = 250;
    const newWidth = Math.round(baseWidth * (size / baseFont));

    document.documentElement.style.setProperty('--sidebar-width', newWidth + 'px');

    // Ajustamos .home si existe
    const home = document.querySelector('.home');
    if (home) {
      home.style.left = newWidth + 'px';
      home.style.width = `calc(100% - ${newWidth}px)`;
    }
  }

  function aplicarTamanio(size) {
    target.style.fontSize = size + "px";
    localStorage.setItem("tamanoLetra", size);
    ajustarSidebar(size);
  }

  // Aplicar tamaño guardado o por defecto
  const guardado = localStorage.getItem("tamanoLetra");
  const fontSize = guardado ? parseFloat(guardado) : originalFontSize;
  aplicarTamanio(fontSize);

  btnAumentar?.addEventListener("click", (e) => {
    e.preventDefault();
    let size = parseFloat(getComputedStyle(target).fontSize);
    if (size < maxFontSize) {
      aplicarTamanio(size + 1);
    }
  });

  btnDisminuir?.addEventListener("click", (e) => {
    e.preventDefault();
    let size = parseFloat(getComputedStyle(target).fontSize);
    if (size > minFontSize) {
      aplicarTamanio(size - 1);
    }
  });

  // Observamos cambios en la clase 'close' para ajustar sidebar cuando se abre/cierra
  const observer = new MutationObserver(() => {
    const currentSize = parseFloat(getComputedStyle(target).fontSize);
    ajustarSidebar(currentSize);
  });

  if (sidebar) {
    observer.observe(sidebar, { attributes: true, attributeFilter: ['class'] });
  }
});
