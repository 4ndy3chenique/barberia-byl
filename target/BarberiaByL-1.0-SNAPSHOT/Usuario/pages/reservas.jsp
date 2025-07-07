<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barbería B&L</title>           
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/Usuario/css/reservas.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-transparent" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index_user.jsp #page-top">
                    <img src="<%= request.getContextPath()%>/assets/ByLogo.svg" alt="Logo Barbería B&L">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse w-100 text-center navbar-nav" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="index_user.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="servicios.jsp">Servicios</a></li>
                        <li class="nav-item"><a class="nav-link" href="productos.jsp">Productos</a></li>
                        <li class="nav-item"><a class="nav-link" href="sedes.jsp">Sedes</a></li>
                        <li class="nav-item"><a class="nav-link" href="reservas.jsp">Reservas</a></li>
                    </ul>
                    <div class="d-flex align-items-center ms-lg-3">
                        <a href="<%= request.getContextPath()%>/logout" class="btn btn-outline-light me-2"
                            onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                            <i class="fas fa-sign-out-alt"></i> Salir
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <header class="masthead position-relative">
            <div class="container text-center">
                <div class="masthead-subheading">¡Reserva tu cita ahora!</div>
                <div class="masthead-heading text-uppercase">
                    Agenda tu próxima visita y disfruta de la experiencia BYL
                </div>
            </div>

            <div class="scroll-down-arrow">
                <i class="fas fa-chevron-down"></i>
            </div>
        </header>



        <header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                    <div class="m-4 m-lg-5">
                        <h1 class="display-5 fw-bold">Reserva tu cita</h1>
                        <p class="fs-4">
                            Agenda tu cita de manera rápida y sencilla para asegurar tu lugar en la experiencia BYL. Nuestro equipo está listo para atenderte y ayudarte a lucir siempre impecable. ¡No esperes más y reserva ahora mismo!
                        </p>
                    </div>
                </div>
            </div>
        </header>

        <main>
            <section class="reserva-form">
                <form action="${pageContext.request.contextPath}/CitaServlet" method="post">
                    <input type="hidden" name="accion" value="crear">

                    <%-- Mensaje de error si hay alguno --%>
                    <% if (request.getAttribute("errorMensaje") != null) { %>
                        <p style="color: red; font-weight: bold;"><%= request.getAttribute("errorMensaje") %></p>
                    <% } %>
                    
                    <%-- Mensaje de éxito después de reservar --%>
                    <% if (request.getAttribute("successMensaje") != null) { %>
                        <p style="color: green; font-weight: bold;"><%= request.getAttribute("successMensaje") %></p>
                    <% } %>

                    <div class="form-group">
                        <label for="nombre">Nombre completo:</label>
                        <input type="text" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="tel" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Correo electrónico:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha">Fecha de la cita:</label>
                        <input type="date" id="fecha" name="fecha" required>
                    </div>
                    <div class="form-group">
                        <label for="hora">Hora de inicio de la cita:</label>
                        <input type="time" id="hora" name="hora" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="horaFin">Hora de fin de la cita:</label>
                        <input type="time" id="horaFin" name="horaFin" required>
                    </div>

                    <div class="form-group">
                        <label for="servicio">Servicio:</label>
                        <select id="servicio" name="servicio" required>
                            <option value="">Selecciona un servicio</option>
                            <option value="Corte de cabello">Corte de cabello</option>
                            <option value="Afeitado">Afeitado</option>
                            <option value="Coloracion">Coloración</option>
                            <option value="Tratamiento capilar">Tratamiento capilar</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="barbero">Barbero (opcional):</label>
                        <select id="barbero" name="barbero">
                            <option value="">Selecciona un barbero (opcional)</option>
                            <option value="Juan">Juan</option>
                            <option value="Pedro">Pedro</option>
                            <option value="Maria">María</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="sede">Sede:</label>
                        <select id="sede" name="sede" required>
                            <option value="">Selecciona una sede</option>
                            <option value="Sede Principal">Sede Principal</option>
                            <option value="Sede Miraflores">Sede Miraflores</option>
                            <option value="Sede San Isidro">Sede San Isidro</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="comentarios">Comentarios adicionales:</label>
                        <textarea id="comentarios" name="comentarios" rows="3"></textarea>
                    </div>
                    
                    <input type="hidden" name="estado" value="Pendiente">

                    <button type="submit" class="btn-reservar">Reservar cita</button>
                </form>
            </section>
        </main>


        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">&copy; Barberia ByL 2025</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Política Privacidad</a>
                        <a class="link-dark text-decoration-none" href="#!">Información</a>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            window.addEventListener('scroll', function () {
                const navbar = document.getElementById('mainNav');
                if (window.scrollY > 50) {
                    navbar.classList.remove('bg-transparent');
                    navbar.classList.add('bg-dark');
                } else {
                    navbar.classList.add('bg-transparent');
                    navbar.classList.remove('bg-dark');
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>