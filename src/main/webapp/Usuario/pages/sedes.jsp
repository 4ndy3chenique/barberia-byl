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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/Usuario/css/sedes.css">
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
                <div class="masthead-subheading">¡Visítanos!</div>
                <div class="masthead-heading text-uppercase">
                    Conoce todas nuestras sedes y ven a vivir la experiencia BYL
                </div>
            </div>

            <!-- Flecha animada -->
            <div class="scroll-down-arrow">
                <i class="fas fa-chevron-down"></i>
            </div>
        </header>

        <header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                    <div class="m-4 m-lg-5">
                        <h1 class="display-5 fw-bold">Visita nuestras sedes</h1>
                        <p class="fs-4">
                            Conoce nuestras modernas sedes ubicadas en puntos estratégicos de Lima, donde te ofrecemos el mejor ambiente, comodidad y atención personalizada para que vivas una experiencia única. En Barbería BYL siempre hay una sede cerca de ti.
                        </p>
                    </div>
                </div>
            </div>
        </header>


        <main class="container py-5 seccion-sedes">
            <!-- Sede 1 -->
            <div class="row align-items-center mb-5 fila-sede">
                <div class="col-lg-6">
                    <img src="<%= request.getContextPath()%>/assets/sede1.jpg" alt="SAN JUAN DE LURIGANCHO" class="imagen-sede">
                </div>
                <div class="col-lg-6 contenido-sede">
                    <h2 class="titulo-sede">San Juan de Lurigancho</h2>
                    <p class="direccion-sede">Av. Del Parque, Canto Rey 1 Etapa, San Juan de Lurigancho, Lima</p>
                    <a href="https://www.google.com/maps/search/?api=1&query=Av.+Del+Parque,+Canto+Rey+1+Etapa,+San+Juan+de+Lurigancho,+Lima"
                       target="_blank" class="boton-mapa">
                        Ver en el mapa
                    </a>
                </div>
            </div>

            <!-- Sede 2 -->
            <div class="row align-items-center mb-5 flex-lg-row-reverse fila-sede">
                <div class="col-lg-6">
                    <img src="<%= request.getContextPath()%>/assets/sede3.jpg" alt="SAN ISIDRO" class="imagen-sede">
                </div>
                <div class="col-lg-6 contenido-sede">
                    <h2 class="titulo-sede">San Isidro</h2>
                    <p class="direccion-sede">Av. José Carlos Mariátegui 2596, San Isidro, Lima</p>
                    <a href="https://www.google.com/maps/search/?api=1&query=Av.+José+Carlos+Mariátegui+2596,+San+Isidro,+Lima"
                       target="_blank" class="boton-mapa">
                        Ver en el mapa
                    </a>
                </div>
            </div>

            <!-- Sede 3 -->
            <div class="row align-items-center mb-5 fila-sede">
                <div class="col-lg-6">
                    <img src="<%= request.getContextPath()%>/assets/sede3.jpg" alt="EL AGUSTINO" class="imagen-sede">
                </div>
                <div class="col-lg-6 contenido-sede">
                    <h2 class="titulo-sede">El Agustino</h2>
                    <p class="direccion-sede">C. Las Agatas 200-290, El Agustino, Lima</p>
                    <a href="https://www.google.com/maps/search/?api=1&query=C.+Las+Agatas+200-290,+El+Agustino,+Lima"
                       target="_blank" class="boton-mapa">
                        Ver en el mapa
                    </a>
                </div>
            </div>
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