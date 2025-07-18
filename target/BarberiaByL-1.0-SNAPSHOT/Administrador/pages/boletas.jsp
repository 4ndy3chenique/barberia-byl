<%@ include file="/proteger.jsp" %>
<%@ page import="Users.BoletasDAO, Users.Boletas, java.util.LinkedList, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    BoletasDAO boletasDAO = new BoletasDAO();
    LinkedList<Boletas> boletas = boletasDAO.list();
    DateTimeFormatter originalFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gesti�n de Boletas - Barber�a BYL</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #e67e22;
                --accent-color: #ecf0f1;
                --background-color: #34495e;
                --highlight-color: #f39c12;

                /* Colores espec�ficos para los botones de acci�n */
                --edit-button-bg: #00bcd4; /* Un azul cian, similar al de la imagen */
                --delete-button-bg: #dc3545; /* Rojo, similar al de la imagen */
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

            .sidebar img {
                width: 70% !important;
                max-width: 100px !important;
                margin: 0 auto !important;
                display: block !important;
                border-bottom: 2px solid #7f8c8d !important;
                border-radius: 50% !important;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
                transition: none;
            }

            .card-form,
            .table-empleados {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
            }

            .card-form h2,
            .table-empleados h2 {
                color: var(--primary-color);
            }

            .table-empleados thead {
                background-color: var(--primary-color);
                color: white;
            }

            .table-empleados th,
            .table-empleados td {
                vertical-align: middle;
            }

            /* --- INICIO DE ESTILOS PARA LOS BOTONES DE ACCI�N (EDITAR Y ELIMINAR) --- */
            .btn-action-custom {
                width: 40px; /* Ancho fijo para hacerlos cuadrados */
                height: 40px; /* Alto fijo para hacerlos cuadrados */
                display: inline-flex; /* Para centrar el �cono vertical y horizontalmente */
                align-items: center; /* Centrar verticalmente */
                justify-content: center; /* Centrar horizontalmente */
                border-radius: 8px; /* Bordes redondeados m�s pronunciados */
                border: none; /* Sin borde */
                cursor: pointer;
                transition: background-color 0.2s ease;
                margin: 0 4px; /* Peque�o margen entre ellos */
                box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* Sutil sombra para dar profundidad */
            }

            .btn-action-edit {
                background-color: var(--edit-button-bg); /* Color azul cian */
            }

            .btn-action-edit:hover {
                background-color: #00a4b8; /* Un tono m�s oscuro al pasar el rat�n */
            }

            .btn-action-delete {
                background-color: var(--delete-button-bg); /* Color rojo */
            }

            .btn-action-delete:hover {
                background-color: #c82333; /* Un tono m�s oscuro al pasar el rat�n */
            }

            /* Estilos espec�ficos para los iconos dentro de los botones de acci�n */
            .btn-action-edit .fas.fa-edit {
                color: #000; /* Icono de editar negro */
                font-size: 0.9em; /* Icono de editar m�s peque�o */
            }

            .btn-action-delete .fas.fa-trash {
                font-size: 0.9em; /* Icono de eliminar m�s peque�o */
                color: white; /* Aseguramos que el icono de eliminar siga siendo blanco */
            }
            /* --- FIN DE ESTILOS PARA LOS BOTONES DE ACCI�N --- */


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

            .modal label {
                color: #2c3e50 !important;
                font-weight: 600;
            }

            /* --- INICIO DE MODIFICACIONES PARA LOS ESTADOS (AJUSTADO: Fuente, Tama�o, Color, MAY�SCULAS) --- */
            .status-badge {
                padding: 5px 10px;
                border-radius: .25rem; /* Menos redondeo */
                font-weight: 700;
                font-size: 0.8em; /* �AJUSTADO! Tama�o m�s peque�o */
                line-height: 1;
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                display: inline-block;
                color: #fff; /* Asegura que el color de texto sea blanco para todos */
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Mismo tipo de letra del body */
                text-transform: uppercase; /* �Todo en may�sculas! */
            }

            .status-pagado {
                background-color: #28a745; /* Verde */
            }

            .status-pendiente {
                background-color: #ffc107; /* Amarillo/Naranja */
            }

            .status-anulado {
                background-color: #dc3545; /* Rojo */
            }
            /* --- FIN DE MODIFICACIONES PARA LOS ESTADOS --- */

        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark d-md-none">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 sidebar collapse d-md-block" id="sidebarMenu">
                    <div class="logo text-center my-4">
                        <img src="../../Administrador/img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle" style="width: 80px;">
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="../../Administrador/pages/citas.jsp" class="nav-link">
                                <i class="fas fa-calendar"></i> <span>Citas</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/usuarios.jsp" class="nav-link">
                                <i class="fas fa-users"></i> <span>Usuarios</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/proveedor.jsp" class="nav-link">
                                <i class="fas fa-store"></i> <span>Proveedores</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/servicio.jsp" class="nav-link">
                                <i class="fas fa-concierge-bell"></i> <span>Servicios</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/productos.jsp" class="nav-link">
                                <i class="fas fa-box"></i> <span>Productos</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/empleado.jsp" class="nav-link">
                                <i class="fas fa-users-cog"></i> <span>Empleados</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/boletas.jsp" class="nav-link active">
                                <i class="fas fa-receipt"></i> <span>Boletas</span>
                            </a>
                        </li>
                        <li class="nav-item mt-5">
                            <a href="<%= request.getContextPath()%>/logout"
                               class="nav-link"
                               onclick="return confirm('�Est�s seguro de que deseas cerrar sesi�n?');">
                                <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-10 offset-md-2 main-content px-3">
                    <div class="row">
                        <div class="col-12">
                            <h1 class="mb-4">
                                Gesti�n de Boletas
                            </h1>
                        </div>
                    </div>
                    <div class="mb-4">
                        <a href="reportedepersonasconmascompras.jsp" class="btn btn-secondary">
                            <i class="fas fa-file-pdf"></i> Ver Reporte de Boletas
                        </a>
                    </div>
                    <%
                        String errorMensaje = (String) request.getAttribute("errorMensaje");
                        if (errorMensaje != null && !errorMensaje.isEmpty()) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <%= errorMensaje%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>
                    <div class="card-form">
                        <h2>
                            Crear Nueva Boleta
                        </h2>
                        <form action="${pageContext.request.contextPath}/BoletasServlet" method="post">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Cliente
                                    </label>
                                    <input type="text" name="cliente" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Fecha
                                    </label>
                                    <input type="date" name="fecha" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Total Bruto
                                    </label>
                                    <input type="number" name="totalBruto" step="0.01" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        M�todo de Pago
                                    </label>
                                    <select name="metodoPago" class="form-select" required>
                                        <option value="">Seleccionar M�todo de Pago</option>
                                        <option value="Efectivo">Efectivo</option>
                                        <option value="Tarjeta">Tarjeta</option>
                                        <option value="Transferencia">Transferencia</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">
                                        Estado
                                    </label>
                                    <select name="estado" class="form-select" required>
                                        <option value="">Seleccionar Estado</option>
                                        <option value="Pendiente">Pendiente</option>
                                        <option value="Pagado">Pagado</option>
                                        <option value="Anulado">Anulado</option>
                                    </select>
                                </div>
                            </div>
                            <div class="text-start">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-plus me-2"></i>Crear Boleta
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card table-responsive">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Lista de Boletas</h2>
                        </div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>Cliente</th>
                                    <th>Fecha</th>
                                    <th>Total Bruto</th>
                                    <th>IGV</th>
                                    <th>Total Neto</th>
                                    <th>M�todo de Pago</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Boletas boleta : boletas) {
                                    // Formatear la fecha
                                    LocalDate date = LocalDate.parse(boleta.getFecha().toString(), originalFormatter);
                                    String formattedDate = date.format(newFormatter);
                                %>
                                <tr>
                                    <td><%= boleta.getCliente()%></td>
                                    <td><%= formattedDate%></td>
                                    <td>S/ <%= String.format("%.2f", boleta.getTotalBruto())%></td>
                                    <td>S/ <%= String.format("%.2f", boleta.getIgv())%></td>
                                    <td>S/ <%= String.format("%.2f", boleta.getTotalNeto())%></td>
                                    <td><%= boleta.getMetodoPago()%></td>
                                    <td>
                                        <span class="status-badge
                                            <%= boleta.getEstado().equals("Pagado") ? "status-pagado"
                                                : boleta.getEstado().equals("Pendiente") ? "status-pendiente"
                                                : "status-anulado"%>">
                                                <%= boleta.getEstado()%>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-center">
                                            <button type="button" class="btn-action-custom btn-action-edit"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#editModal<%= boleta.getIdBoleta()%>"
                                                    title="Editar">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn-action-custom btn-action-delete"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#deleteModal<%= boleta.getIdBoleta()%>"
                                                    title="Eliminar">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <div class="modal fade" id="editModal<%= boleta.getIdBoleta()%>" tabindex="-1" aria-labelledby="editModalLabel<%= boleta.getIdBoleta()%>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= boleta.getIdBoleta()%>">Editar Boleta</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="${pageContext.request.contextPath}/BoletasServlet" method="post">
                                                    <input type="hidden" name="accion" value="editar">
                                                    <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta()%>">
                                                    <div class="mb-3">
                                                        <label class="form-label">Cliente</label>
                                                        <input type="text" name="cliente" class="form-control" value="<%= boleta.getCliente()%>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Fecha</label>
                                                        <input type="date" name="fecha" class="form-control" value="<%= boleta.getFecha()%>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Total Bruto</label>
                                                        <input type="number" name="totalBruto" class="form-control" value="<%= boleta.getTotalBruto()%>" step="0.01" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">M�todo de Pago</label>
                                                        <select name="metodoPago" class="form-select" required>
                                                            <option value="">Seleccionar M�todo de Pago</option>
                                                            <option value="Efectivo" <%= boleta.getMetodoPago().equals("Efectivo") ? "selected" : ""%>>Efectivo</option>
                                                            <option value="Tarjeta" <%= boleta.getMetodoPago().equals("Tarjeta") ? "selected" : ""%>>Tarjeta</option>
                                                            <option value="Transferencia" <%= boleta.getMetodoPago().equals("Transferencia") ? "selected" : ""%>>Transferencia</option>
                                                        </select>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Estado</label>
                                                        <select name="estado" class="form-select" required>
                                                            <option value="">Seleccionar Estado</option>
                                                            <option value="Pendiente" <%= boleta.getEstado().equals("Pendiente") ? "selected" : ""%>>Pendiente</option>
                                                            <option value="Pagado" <%= boleta.getEstado().equals("Pagado") ? "selected" : ""%>>Pagado</option>
                                                            <option value="Anulado" <%= boleta.getEstado().equals("Anulado") ? "selected" : ""%>>Anulado</option>
                                                        </select>
                                                    </div>
                                                    <div class="text-end">
                                                        <button type="submit" class="btn btn-primary">Actualizar Boleta</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="deleteModal<%= boleta.getIdBoleta()%>" tabindex="-1" aria-labelledby="deleteModalLabel<%= boleta.getIdBoleta()%>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteModalLabel<%= boleta.getIdBoleta()%>">Eliminar Boleta</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>�Est�s seguro de que deseas eliminar esta boleta?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <form action="${pageContext.request.contextPath}/BoletasServlet" method="post">
                                                    <input type="hidden" name="accion" value="eliminar">
                                                    <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta()%>">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>