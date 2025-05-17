document.addEventListener("turbo:load", () => {
  const grayscaleBtn = document.getElementById("grayscale-toggle-btn");
  const body = document.querySelector('html');

  grayscaleBtn.addEventListener("click", (e) => {
    e.preventDefault();
    body.classList.toggle("grayscale");
  });
});
