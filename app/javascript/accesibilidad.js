document.addEventListener("turbo:load", () => {
  const showMenuBtn = document.getElementById("show-menu-btn");
  const showAccBtn = document.getElementById("show-accesibilidad-btn");
  const menu = document.getElementById("menu-container");
  const accesibilidad = document.getElementById("accesibilidad-container");

  showMenuBtn.addEventListener("click", (e) => {
    e.preventDefault();
    menu.style.display = "block";
    accesibilidad.style.display = "none";
  });

  showAccBtn.addEventListener("click", (e) => {
    e.preventDefault();
    menu.style.display = "none";
    accesibilidad.style.display = "block";
  });
    $(document).ready(function() {
    $('.select2').select2({
      placeholder: "Selecciona un producto",
      allowClear: true,
      width: '100%'
    });
  });
  
});
