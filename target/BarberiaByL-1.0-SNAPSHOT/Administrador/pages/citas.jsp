<%@ page import="Users.CitaDAO, Users.Cita, java.util.LinkedList" %>
<%@ include file="/proteger.jsp" %>
<%
    // Obtener la lista de citas
    CitaDAO citaDAO = new CitaDAO();
    LinkedList<Cita> citas = citaDAO.list();
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Citas - Barbería</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #e67e22;
                --accent-color: #ecf0f1;
                --background-color: #34495e;
                --highlight-color: #f39c12;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: var(--background-color);
                color: white;
                margin: 0;
                padding: 0;
            }

            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                width: 250px;
                height: 100%;
                background-color: var(--primary-color);
                color: white;
                z-index: 1000;
                transition: none;
            }

            .sidebar .nav-link {
                color: #ecf0f1;
                padding: 15px;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing: 1px;
                border-bottom: 1px solid #7f8c8d;
                transition: background-color 0.3s;
            }

            .sidebar .nav-link:hover {
                background-color: var(--secondary-color);
                color: white;
            }

            .sidebar .nav-link.active {
                background-color: var(--highlight-color);
                color: white;
            }

            /* Imagen con tamaño igual al CSS de productos */
            .sidebar img {
                width: 70%;
                max-width: 100px;
                margin: 0 auto;
                display: block;
                border-bottom: 2px solid #7f8c8d;
                border-radius: 50%;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
                transition: none;
            }

            .card-form,
            .table-empleados { /* This class is not used in the HTML for the table. Consider using .card for consistency if it's meant to style tables. */
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
            }

            /* The table itself is within a .card, so you might want to adjust these selectors if table-empleados was intended for the table card. */
            .card-form h2,
            .table-empleados h2 { /* This applies to the card holding the table too because the table is within a .card */
                color: var(--primary-color);
            }

            .table-striped thead { /* Changed from .table-empleados thead to target .table-striped */
                background-color: var(--primary-color);
                color: white;
            }

            .table-striped th, /* Changed from .table-empleados th to target .table-striped */
            .table-striped td { /* Changed from .table-empleados td to target .table-striped */
                vertical-align: middle;
            }

            /* Estilo para los botones de acción en la tabla */
            .action-buttons .btn {
                margin-right: 8px; /* Espacio entre los botones */
            }

            .action-buttons .btn:last-child {
                margin-right: 0; /* No hay margen a la derecha para el último botón */
            }


            @media (max-width: 768px) {
                .sidebar {
                    width: 200px;
                }
                .main-content {
                    margin-left: 200px;
                }
            }

            .card-form label {
                color: #2c3e50;
                font-weight: 600;
            }

            .card-form input,
            .card-form select,
            .card-form textarea {
                background-color: #f9f9f9;
                color: #2c3e50;
                border: 1px solid #ccc;
            }

            .modal input,
            .modal select,
            .modal textarea {
                background-color: #f9f9f9 !important;
                color: #2c3e50 !important;
                border: 1px solid #ccc;
            }

            /* Para que el texto de los modals sea negro y se vea bien sobre fondo blanco */
            .modal-content,
            .modal-content .modal-title,
            .modal-content p,
            .modal-content label {
                color: #222 !important;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 sidebar" id="sidebar">
                    <div class="logo text-center my-4">
                        <img src="../../Administrador/img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle">
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="../../Administrador/pages/citas.jsp" class="nav-link active">
                                <i class="fas fa-calendar"></i> Citas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/usuarios.jsp" class="nav-link">
                                <i class="fas fa-users"></i> Usuarios
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/proveedor.jsp" class="nav-link">
                                <i class="fas fa-store"></i> Proveedores
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/servicio.jsp" class="nav-link">
                                <i class="fas fa-concierge-bell"></i> Servicios
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/productos.jsp" class="nav-link">
                                <i class="fas fa-box"></i> Productos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/empleado.jsp" class="nav-link">
                                <i class="fas fa-users-cog"></i> Empleados
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/boletas.jsp" class="nav-link">
                                <i class="fas fa-receipt"></i> Boletas
                            </a>
                        </li>
                        <li class="nav-item mt-5">
                            <a href="<%= request.getContextPath()%>/logout"
                               class="nav-link"
                               onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                                <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                            </a>

                        </li>
                    </ul>
                </div>

                <div class="col-md-10 main-content" id="mainContent">
                    <h1 class="my-4">Gestión de Citas</h1>
                    <div class="card-form">
                        <h2 class="mb-4">Crear Cita</h2>
                        <form action="${pageContext.request.contextPath}/CitaServlet" method="post" id="createCitaForm">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Empleado</label>
                                    <input type="text" name="empleado" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Servicio</label>
                                    <input type="text" name="servicio" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Sede</label>
                                    <input type="text" name="sede" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Fecha</label>
                                    <input type="date" name="fecha" id="createFecha" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Hora Inicio</label>
                                    <input type="time" name="horaInicio" id="createHoraInicio" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Hora Fin</label>
                                    <input type="time" name="horaFin" id="createHoraFin" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Nombre del Cliente</label>
                                    <input type="text" name="clienteNombre" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Estado</label>
                                    <select name="estado" class="form-control" required>
                                        <option value="PENDIENTE">Pendiente</option>
                                        <option value="VALIDADO">Validado</option>
                                        <option value="CANCELADO">Cancelado</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus"></i> Crear Cita
                            </button>
                        </form>
                    </div>
                    <div class="card table-responsive">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Lista de Citas</h2>
                        </div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>Empleado</th>
                                    <th>Servicio</th>
                                    <th>Sede</th>
                                    <th>Fecha</th>
                                    <th>Hora Inicio</th>
                                    <th>Hora Fin</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    // Formato para la fecha
                                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                    for (Cita cita : citas) {
                                %>
                                <tr>
                                    <td><%= cita.getEmpleado()%></td>
                                    <td><%= cita.getServicio()%></td>
                                    <td><%= cita.getSede()%></td>
                                    <td><%= dateFormat.format(cita.getFecha())%></td> <%-- Formato dd/MM/yyyy --%>
                                    <td><%= cita.getHoraInicio()%></td>
                                    <td><%= cita.getHoraFin()%></td>
                                    <td><%= cita.getClienteNombre()%></td>
                                    <td>
                                        <%
                                            String estadoClass = "";
                                            switch (cita.getEstado()) {
                                                case "PENDIENTE":
                                                    estadoClass = "badge bg-warning";
                                                    break;
                                                case "VALIDADO":
                                                    estadoClass = "badge bg-success";
                                                    break;
                                                case "CANCELADO":
                                                    estadoClass = "badge bg-danger";
                                                    break;
                                            }
                                        %>
                                        <span class="<%= estadoClass%>"><%= cita.getEstado()%></span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="btn btn-info edit-btn" data-id="<%= cita.getIdCita()%>" data-bs-toggle="modal" data-bs-target="#editModal">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-danger delete-btn" data-id="<%= cita.getIdCita()%>" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal fade" id="editModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Editar Cita</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/CitaServlet" method="post" id="editCitaForm">
                                        <input type="hidden" name="accion" value="actualizar">
                                        <input type="hidden" name="idCita" id="editIdCita">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Empleado</label>
                                                <input type="text" name="empleado" id="editEmpleado" class="form-control" required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Servicio</label>
                                                <input type="text" name="servicio" id="editServicio" class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Sede</label>
                                                <input type="text" name="sede" id="editSede" class="form-control" required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Fecha</label>
                                                <input type="date" name="fecha" id="editFecha" class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Hora Inicio</label>
                                                <input type="time" name="horaInicio" id="editHoraInicio" class="form-control" required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Hora Fin</label>
                                                <input type="time" name="horaFin" id="editHoraFin" class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Nombre del Cliente</label>
                                                <input type="text" name="clienteNombre" id="editClienteNombre" class="form-control" required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Estado</label>
                                                <select name="estado" id="editEstado" class="form-control" required>
                                                    <option value="PENDIENTE">Pendiente</option>
                                                    <option value="VALIDADO">Validado</option>
                                                    <option value="CANCELADO">Cancelado</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save"></i> Guardar Cambios
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="deleteModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Eliminar Cita</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <p>¿Estás seguro de que deseas eliminar esta cita?</p>
                                    <form action="${pageContext.request.contextPath}/CitaServlet" method="post">
                                        <input type="hidden" name="accion" value="eliminar">
                                        <input type="hidden" name="idCita" id="deleteIdCita">
                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn btn-danger me-2">Eliminar</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <script>
            // Función para obtener la fecha de hoy en formato YYYY-MM-DD
            function getTodayDate() {
                const today = new Date();
                const year = today.getFullYear();
                const month = String(today.getMonth() + 1).padStart(2, '0'); // Meses son 0-11
                const day = String(today.getDate()).padStart(2, '0');
                return `${year}-${month}-${day}`;
            }

            // Función para obtener la hora actual en formato HH:mm
            function getCurrentTime() {
                const now = new Date();
                const hours = String(now.getHours()).padStart(2, '0');
                const minutes = String(now.getMinutes()).padStart(2, '0');
                return `${hours}:${minutes}`;
            }

            // Setear la fecha mínima para el campo de "Fecha" al crear cita
            document.addEventListener('DOMContentLoaded', function() {
                const createFechaInput = document.getElementById('createFecha');
                if (createFechaInput) {
                    createFechaInput.min = getTodayDate();
                }

                // Setear la hora de inicio por defecto a la hora actual al crear cita
                const createHoraInicioInput = document.getElementById('createHoraInicio');
                if (createHoraInicioInput) {
                    createHoraInicioInput.value = getCurrentTime();
                }
            });

            // Validar la fecha y hora al enviar el formulario de creación
            document.getElementById('createCitaForm').addEventListener('submit', function(event) {
                const fechaInput = document.getElementById('createFecha');
                const horaInicioInput = document.getElementById('createHoraInicio');
                const horaFinInput = document.getElementById('createHoraFin');

                const selectedDate = new Date(fechaInput.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0); // Resetear hora para comparar solo la fecha

                // Validar que la fecha no sea anterior a hoy
                if (selectedDate < today) {
                    alert('La fecha de la cita no puede ser anterior a hoy.');
                    event.preventDefault();
                    return;
                }

                // Si la fecha es hoy, validar que la hora de inicio no sea anterior a la hora actual
                if (selectedDate.getTime() === today.getTime()) {
                    const currentTime = getCurrentTime();
                    if (horaInicioInput.value < currentTime) {
                        alert('La hora de inicio no puede ser anterior a la hora actual para una cita hoy.');
                        event.preventDefault();
                        return;
                    }
                }

                // Validar que la hora de fin sea posterior a la hora de inicio
                if (horaFinInput.value <= horaInicioInput.value) {
                    alert('La hora de fin debe ser posterior a la hora de inicio.');
                    event.preventDefault();
                    return;
                }
            });

            // Validar la fecha y hora al enviar el formulario de edición
            document.getElementById('editCitaForm').addEventListener('submit', function(event) {
                const fechaInput = document.getElementById('editFecha');
                const horaInicioInput = document.getElementById('editHoraInicio');
                const horaFinInput = document.getElementById('editHoraFin');

                const selectedDate = new Date(fechaInput.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0); // Resetear hora para comparar solo la fecha

                // Validar que la fecha no sea anterior a hoy
                if (selectedDate < today) {
                    alert('La fecha de la cita no puede ser anterior a hoy.');
                    event.preventDefault();
                    return;
                }

                // Si la fecha es hoy, validar que la hora de inicio no sea anterior a la hora actual
                if (selectedDate.getTime() === today.getTime()) {
                    const currentTime = getCurrentTime();
                    if (horaInicioInput.value < currentTime) {
                        alert('La hora de inicio no puede ser anterior a la hora actual para una cita hoy.');
                        event.preventDefault();
                        return;
                    }
                }

                // Validar que la hora de fin sea posterior a la hora de inicio
                if (horaFinInput.value <= horaInicioInput.value) {
                    alert('La hora de fin debe ser posterior a la hora de inicio.');
                    event.preventDefault();
                    return;
                }
            });

            // Llenar el modal de edición con los datos de la cita seleccionada
            document.querySelectorAll('.edit-btn').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    const tr = btn.closest('tr');
                    const tds = tr.querySelectorAll('td');

                    document.getElementById('editIdCita').value = btn.getAttribute('data-id');
                    document.getElementById('editEmpleado').value = tds[0].textContent.trim();
                    document.getElementById('editServicio').value = tds[1].textContent.trim();
                    document.getElementById('editSede').value = tds[2].textContent.trim();

                    // Fecha: convertir a formato YYYY-MM-DD para el input type="date"
                    let fechaOriginal = tds[3].textContent.trim();
                    let partesFecha = fechaOriginal.split('/');
                    let fechaFormatoISO = `${partesFecha[2]}-${partesFecha[1]}-${partesFecha[0]}`;
                    document.getElementById('editFecha').value = fechaFormatoISO;

                    // Setear la fecha mínima para el campo de "Fecha" al editar cita
                    document.getElementById('editFecha').min = getTodayDate();

                    // Hora inicio y fin: convertir a formato HH:mm si viene con segundos
                    let horaInicio = tds[4].textContent.trim();
                    if (horaInicio.length > 5)
                        horaInicio = horaInicio.substring(0, 5);
                    document.getElementById('editHoraInicio').value = horaInicio;

                    let horaFin = tds[5].textContent.trim();
                    if (horaFin.length > 5)
                        horaFin = horaFin.substring(0, 5);
                    document.getElementById('editHoraFin').value = horaFin;

                    document.getElementById('editClienteNombre').value = tds[6].textContent.trim();
                    var estado = tds[7].querySelector('span').textContent.trim();
                    document.getElementById('editEstado').value = estado;
                });
            });

            // Llenar el id de cita en el modal de eliminar
            document.querySelectorAll('.delete-btn').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    document.getElementById('deleteIdCita').value = btn.getAttribute('data-id');
                });
            });
        </script>
    </body>
</html>