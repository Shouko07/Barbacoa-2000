document.addEventListener("turbo:load", () => {
  const grayscaleBtn = document.getElementById("grayscale-toggle-btn");
  const body = document.querySelector('html');

  grayscaleBtn.addEventListener("click", (e) => {
    e.preventDefault();
    grayscaleBtn.parentElement.classList.toggle("activo");
    body.classList.toggle("grayscale");
  });
});
