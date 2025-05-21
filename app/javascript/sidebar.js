document.addEventListener("turbo:load", () => {
  const body = document.querySelector("body"),
        sidebar = body.querySelector("nav"),
        toggle = body.querySelector(".toggle"),
        modeSwitch = body.querySelector(".toggle-switch"),
        modeText = body.querySelector(".mode-text");

  // Leer estado guardado al cargar
  if (localStorage.getItem("modoOscuro") === "true") {
    body.classList.add("dark");
    if (modeText) modeText.innerText = "Modo claro";
  } else {
    body.classList.remove("dark");
    if (modeText) modeText.innerText = "Modo oscuro";
  }

  // Toggle del menú lateral
  toggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
  });

  // Toggle del modo oscuro
  modeSwitch.addEventListener("click", () => {
    body.classList.toggle("dark");
    
    const modoOscuroActivo = body.classList.contains("dark");
    localStorage.setItem("modoOscuro", modoOscuroActivo); // Guardar preferencia

    if (modoOscuroActivo) {
      modeText.innerText = "Modo claro";
    } else {
      modeText.innerText = "Modo oscuro";
    }
  });
});
