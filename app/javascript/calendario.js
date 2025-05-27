document.addEventListener("turbo:load", () => {
  const calendarEl = document.querySelector("#calendar");
  if (calendarEl) {
    // Inicializa el calendario
    new datedreamer.calendar({
      element: "#calendar",
      format: "YYYY-MM-DD",
      onChange: (e) => {
        const fechaSeleccionada = e.detail;
        console.log("Fecha seleccionada:", fechaSeleccionada);
        if (fechaSeleccionada) {
          window.location.href = `/reportes/por_fecha/${fechaSeleccionada}`;
        }
      },
      inputLabel: "Selecciona una fecha",
      inputPlaceholder: "YYYY-MM-DD",
      theme: "lite-purple",
      styles: `
        .datedreamer__calendar {
          max-width: none !important;
          width: 600px !important;
          padding: 20px !important;
          box-shadow: none;
          border: none;
          background: #fff;
        }
        .datedreamer__calendar_days .datedreamer__calendar_day button {
          font-size: 24px !important;
          padding: 12px !important;
        }
        .datedreamer__calendar_title {
          font-size: 28px !important;
          font-weight: 700 !important;
        }
        .datedreamer__calendar_day-header.datedreamer__calendar_day {
          font-size: 20px !important;
        }
        .datedreamer__calendar_prev svg,
        .datedreamer__calendar_next svg {
          transform: scale(3) !important;
        }
        .datedreamer__calendar_inputs label,
        .datedreamer__calendar_inputs input,
        .datedreamer__calendar_inputs button {
          font-size: 1.3rem;
        }
        .datedreamer__calendar_inputs button {
          background-color: #603719;
          border: 1px solid #603719;
          border-radius: 8px;
          color: white;
          padding: 6px 12px;
          cursor: pointer;
          font-weight: 500;
        }
        .datedreamer__calendar_inputs button:hover {
          background-color: #4b2813;
          border-color: #4b2813;
        }
        .datedreamer__calendar_day.active button {
          background-color: #603719 !important;
          border-radius: 8px;
          color: white !important;
          font-weight: 600;
        }
        
      `
    });
  }

  // Actualizar fecha, hora y día solo si los elementos existen
  const diaActualEl = document.getElementById("dia-actual");
  const fechaActualEl = document.getElementById("fecha-actual");
  const horaActualEl = document.getElementById("hora-actual");

  if (diaActualEl && fechaActualEl && horaActualEl) {
    function actualizarDatosDelDia() {
      const ahora = new Date();
      const opcionesDiaActual = { day: 'numeric' };
      const opcionesFecha = { year: 'numeric', month: 'long' };
      const opcionesDia = { weekday: 'long' };

      diaActualEl.textContent = ahora.toLocaleDateString('es-ES', opcionesDiaActual);
      fechaActualEl.textContent = ahora.toLocaleDateString('es-ES', opcionesFecha);
      horaActualEl.textContent = ahora.toLocaleTimeString('es-ES');
    }

    actualizarDatosDelDia();
    setInterval(actualizarDatosDelDia, 1000);
  }
});
