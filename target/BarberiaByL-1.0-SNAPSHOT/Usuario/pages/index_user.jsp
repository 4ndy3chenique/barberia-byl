<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="es">
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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/Usuario/css/index_user.css">
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

        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">¡Agenda tu experiencia con nosotros!</div>
                <div class="masthead-heading text-uppercase">Reserva tu cita o explora nuestra tienda en línea.</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="reservas.jsp">Reservar Cita</a>
                <a class="btn btn-xl btn-outline-light text-uppercase  fw-bold " href="productos.jsp" style="border-radius: 5px; min-width: 170px; min-height: 70px;">
                    Ver Productos
                </a>
            </div>
        </header>       


        <!-- Empresas -->
        <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!">
                            <img class="img-fluid img-brand d-block mx-auto" 
                                 src="<%= request.getContextPath()%>/assets/empresa4.svg" 
                                 alt="Empresa 4" />
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!">
                            <img class="img-fluid img-brand d-block mx-auto" 
                                 src="<%= request.getContextPath()%>/assets/empresa3.svg" 
                                 alt="Empresa 3" />
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!">
                            <img class="img-fluid img-brand d-block mx-auto" 
                                 src="<%= request.getContextPath()%>/assets/empresa2.svg" 
                                 alt="Empresa 6" />
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!">
                            <img class="img-fluid img-brand d-block mx-auto" 
                                 src="<%= request.getContextPath()%>/assets/empresa6.svg" 
                                 alt="Empresa 6" />
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <section style="background: #fff0f0; padding: 40px 0; text-align: center;">
            <div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap; max-width: 1000px; margin: 0 auto; gap: 20px;">

                <!-- Texto -->
                <div style="flex: 1; min-width: 300px; text-align: left; padding: 20px;">
                    <h2 style="font-size: 28px; font-weight: bold; line-height: 1.2;">
                        TU SERVICIO DE BARBERÍA <br> PERSONAL EN CASA
                    </h2>
                    <p style="margin: 20px 0; color: #333;">
                        Ofrecemos un servicio personalizado de barbería directamente en la comodidad de tu hogar. Nuestro objetivo es que luzcas impecable en cualquier momento con la máxima comodidad.
                    </p>

                    <div style="display: flex; gap: 40px; margin-top: 20px;">
                        <div>
                            <span style="font-size: 28px; font-weight: bold; color: #d4a20c;">99%</span><br>
                            <span style="font-weight: bold;">Satisfacción</span>
                        </div>
                        <div>
                            <span style="font-size: 28px; font-weight: bold; color: #d4a20c;">10+</span><br>
                            <span style="font-weight: bold;">Años de <br> experiencia</span>
                        </div>
                    </div>
                </div>

                <!-- Imagen -->
                <div style="flex: 1; min-width: 300px; text-align: center;">
                    <img src="<%= request.getContextPath()%>/assets/barbero-corte.jpg" alt="Barbero trabajando" style="max-width: 100%; border-radius: 8px;">
                </div>
            </div>
        </section>

        <section style="background: #fce9e6; padding: 40px 0; text-align: center;">
            <h2 style="text-transform: uppercase; font-weight: bold; font-size: 28px;">Nuestros Servicios</h2>
            <p style="max-width: 600px; margin: 10px auto; font-size: 14px; color: #333;">
                Conoce todos los servicios que tenemos para ti y reserva tu cita hoy mismo. Elige el corte o tratamiento que mejor se adapte a tu estilo.
            </p>

            <div style="display: flex; justify-content: center; flex-wrap: wrap; max-width: 800px; margin: 40px auto; gap: 20px;">
                <!-- Columna izquierda -->
                <div style="flex: 1; min-width: 300px;">
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-user fa-2x"></i>
                        <strong>Corte para Adultos</strong>
                        <p>Corte clásico y personalizado para adultos.</p>
                        <span><strong>S/ 145.00</strong></span>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-child fa-2x"></i>
                        <strong>Corte para Niños</strong>
                        <p>Corte adaptado para los más pequeños.</p>
                        <span><strong>S/ 70.00</strong></span>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-beard fa-2x"></i>
                        <strong>Recorte de Barba</strong>
                        <p>Perfilado y mantenimiento de la barba.</p>
                        <span><strong>S/ 110.00</strong></span>
                    </div>
                </div>

                <!-- Columna derecha -->
                <div style="flex: 1; min-width: 300px;">
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-cut fa-2x"></i>
                        <strong>Afeitado de Cuello</strong>
                        <p>Afeitado profesional para un acabado limpio.</p>
                        <span><strong>S/ 145.00</strong></span>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-water fa-2x"></i>
                        <strong>Hidratación del Cuero Cabelludo</strong>
                        <p>Tratamiento para revitalizar el cuero cabelludo.</p>
                        <span><strong>S/ 37.00</strong></span>
                    </div>
                    <div style="margin-bottom: 20px;">
                        <i class="fas fa-user-tie fa-2x"></i>
                        <strong>Arreglo de Barba Completo</strong>
                        <p>Cuidado integral y detallado de la barba.</p>
                        <span><strong>S/ 180.00</strong></span>
                    </div>
                </div>
            </div>

            <a href="servicios.jsp" style="display: inline-block; margin-top: 20px; padding: 12px 24px; background-color: #d4a20c; color: white; text-decoration: none; font-weight: bold; border-radius: 4px;">
                Ver Servicios
            </a>
        </section>




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
