document.addEventListener("turbo:load", () => {
  const dyslexiaBtn = document.getElementById("dyslexia-toggle");

  // Restaurar estado guardado en localStorage
  if (localStorage.getItem("dyslexia") === "true") {
    document.body.classList.add("dyslexia-mode");
    dyslexiaBtn.parentElement.classList.add("activo");
  } else {
    document.body.classList.remove("dyslexia-mode");
    dyslexiaBtn.parentElement.classList.remove("activo");
  }

  dyslexiaBtn.addEventListener("click", (e) => {
    e.preventDefault();
    document.body.classList.toggle("dyslexia-mode");
    const isActive = document.body.classList.contains("dyslexia-mode");
    localStorage.setItem("dyslexia", isActive);
    dyslexiaBtn.parentElement.classList.toggle("activo", isActive);
  });
});