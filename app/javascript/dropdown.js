document.addEventListener("turbo:load", () => {
  const searchInput = document.getElementById("product-search");
  const productList = document.getElementById("product-list");
  const items = Array.from(document.querySelectorAll(".product-item"));
  const selectedContainer = document.getElementById("selected-products");
  const hiddenProductoId = document.getElementById("producto-id-hidden");
  const cantidadInput = document.querySelector('input[name="cantidad"]');
  const form = document.querySelector("form");

  if (!searchInput || items.length === 0 || !hiddenProductoId || !cantidadInput || !form) return;

function showSelectedTag(name) {
  selectedContainer.innerHTML = '';

  const tag = document.createElement("span");
  tag.className = "selected-product-tag";
  tag.textContent = name;

  const icon = document.createElement("span");
  icon.style.marginLeft = "0.5rem";
  icon.style.fontWeight = "bold";

  tag.appendChild(icon);
  selectedContainer.appendChild(tag);
}

  // --- Variables para control de navegación por teclado ---
  let currentHighlightIndex = -1;  // índice del producto resaltado (-1 = ninguno)

  // Función para actualizar el resaltado visual
  function updateHighlight() {
    visibleItems().forEach((item, i) => {
      if (i === currentHighlightIndex) {
        item.classList.add("highlighted");
        // Hacer scroll para asegurar que se vea
        item.scrollIntoView({ block: "nearest" });
      } else {
        item.classList.remove("highlighted");
      }
    });
  }

  // Filtrar productos según búsqueda
  searchInput.addEventListener("input", () => {
    const query = searchInput.value.toLowerCase();

    if (query.length === 0) {
      productList.style.display = "none";
      currentHighlightIndex = -1; // reset resaltado
      updateHighlight();
      return;
    }

    productList.style.display = "block";

    items.forEach(item => {
      const nombre = item.dataset.nombre;
      item.style.display = nombre.includes(query) ? "block" : "none";
    });

    // Reset índice cuando cambia búsqueda
    currentHighlightIndex = -1;
    updateHighlight();
  });

  // Devuelve solo los items visibles
  function visibleItems() {
    return items.filter(item => item.style.display !== "none");
  }

  // Seleccionar producto al hacer click
  items.forEach(item => {
    item.addEventListener("click", () => {
      const id = item.dataset.id;
      const nombre = item.textContent.trim();

      hiddenProductoId.value = id;
      showSelectedTag(nombre);
      searchInput.value = "";
      productList.style.display = "none";
      currentHighlightIndex = -1;
      updateHighlight();
      searchInput.blur(); // Quitar foco del buscador al seleccionar producto
    });
  });

  // Enter en el buscador para seleccionar primer producto visible o producto resaltado
  searchInput.addEventListener("keydown", (e) => {
    if (e.key === "ArrowDown") {
      e.preventDefault();
      const visibles = visibleItems();
      if (visibles.length === 0) return;

      if (currentHighlightIndex < visibles.length - 1) {
        currentHighlightIndex++;
      } else {
        currentHighlightIndex = 0; // loop
      }
      updateHighlight();
    } else if (e.key === "ArrowUp") {
      e.preventDefault();
      const visibles = visibleItems();
      if (visibles.length === 0) return;

      if (currentHighlightIndex > 0) {
        currentHighlightIndex--;
      } else {
        currentHighlightIndex = visibles.length - 1; // loop
      }
      updateHighlight();
    } else if (e.key === "Enter") {
      e.preventDefault();
      const visibles = visibleItems();

      // Si hay un producto resaltado, seleccionarlo
      if (currentHighlightIndex >= 0 && currentHighlightIndex < visibles.length) {
        visibles[currentHighlightIndex].click();
      } else {
        // Si no hay resaltado, seleccionar el primero visible
        const visibleItem = visibles[0];
        if (visibleItem) {
          visibleItem.click();
        }
      }
      e.stopPropagation();
    }
  });

  // Enter fuera del buscador para enviar el formulario
  document.addEventListener("keydown", (e) => {
    const active = document.activeElement;
    const activeTag = active.tagName.toLowerCase();

    if (active === searchInput) {
      // No interferir con Enter dentro del buscador
      if (e.key === "Enter") return;
    } else if (activeTag === "input" || activeTag === "select" || active.isContentEditable) {
      // Si el foco está en otro input, select o contenido editable, no interferir
      return;
    }

    if (e.key === "Enter") {
      if (activeTag === "input" || activeTag === "select" || active.isContentEditable) {
        // No hacer submit si estamos en un input/select o contenteditable
        return;
      }
      e.preventDefault();
      // Submit del formulario
      if (form) form.submit();
    }

    // Si presionas letras o espacios fuera de inputs, agregarlos a la búsqueda y poner foco ahí
    if (/^[a-zñáéíóúü ]$/i.test(e.key)) {
      searchInput.value += e.key;
      searchInput.dispatchEvent(new Event('input'));
      searchInput.focus();
      e.preventDefault();
    }

    // Si presionas números fuera de inputs, agregarlos a cantidad
    if (/^\d$/.test(e.key)) {
      if (cantidadInput.value === "1" || cantidadInput.value === "") {
        cantidadInput.value = e.key;
      } else {
        cantidadInput.value += e.key;
      }
      e.preventDefault();
    }
  });

  // Si la página carga con un producto ya seleccionado (ejemplo: edición), mostrarlo
  if (hiddenProductoId.value) {
    const selectedItem = items.find(item => item.dataset.id === hiddenProductoId.value);
    if (selectedItem) {
      showSelectedTag(selectedItem.textContent.trim());
    }
  }
});
