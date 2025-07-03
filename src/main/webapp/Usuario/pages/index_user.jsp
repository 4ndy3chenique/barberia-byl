<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barbería B&L</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/Usuario/css/index_user.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="index_user.jsp">
                    <img src="<%= request.getContextPath()%>/assets/ByLogo.svg" alt="Logo Barbería B&L">
                </a>

                <!-- Botón para colapsar menú en móviles -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menú
                    <i class="fas fa-bars ms-1"></i>
                </button>

                <!-- Menú -->
                <div class="collapse navbar-collapse w-100 text-center navbar-nav" id="navbarResponsive">
                    <ul class="navbar-nav  ms-auto py-4 py-lg-0">
                        <li class="nav-item w-100"><a class="nav-link" href="index_user.jsp">Inicio</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="servicios.jsp">Servicios</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="productos.jsp">Productos</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="sedes.jsp">Sedes</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="reservas.jsp">Reservas</a></li>
                    </ul>

                    <!-- Usuario / sesión -->
                    <div class="d-flex align-items-center ms-lg-3">
                        <a href="<%= request.getContextPath()%>/logout" 
                           class="btn btn-outline-light me-2"
                           onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                            <i class="fas fa-sign-out-alt"></i> Salir
                        </a>
                        <img src="<%= request.getContextPath()%>/assets/user-icon.png" alt="User Icon" class="rounded-circle" width="40" height="40">
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <!-- HERO: Imagen y Nosotros a la par -->
            <div class="hero-row">
                <div class="hero-img-box">
                    <div class="col-md-12" id="left_section_index_1" style="width:100%;">
                        <div id="carouselExampleIndicators" class="carousel slide h-100" data-ride="carousel">
                            <div class="carousel-inner h-100">
                                <div class="carousel-item active h-100">
                                    <img src="../../assets/imagen menu1.png" class="d-block w-100 h-100" alt="Imagen 1">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="../../assets/imagen menu2.png" class="d-block w-100 h-100" alt="Imagen 2">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="../../assets/imagen menu3.png" class="d-block w-100 h-100" alt="Imagen 3">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="hero-text-box">
                    <h2>LA BARBERÍA</h2>
                    <h3>NOSOTROS</h3>
                    <p>
                        Somos un punto de barbería auténtica. Nos hemos creado nuestro propio espacio para que disfrutes de cortes y afeitados de calidad en un ambiente que combina lo clásico y lo moderno. Nuestro equipo te espera con experiencia y pasión.
                    </p>
                    <a href="reservas.jsp" class="btn btn-reservar">Reservar cita</a>
                </div>
            </div>

            <!-- SERVICIOS -->
            <div class="servicios-row">
                <div class="servicio-item">
                    <h4>Corte de Cabello</h4>
                    <div id="carruselCorteCabello" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../assets/CorteDeCabello1.png" class="d-block w-100" alt="Corte de Cabello 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/CorteDeCabello2.png" class="d-block w-100" alt="Corte de Cabello 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/CorteDeCabello3.png" class="d-block w-100" alt="Corte de Cabello 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselCorteCabello" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselCorteCabello" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                    <p>Desde estilos clásicos hasta las últimas tendencias. ¡Déjate asesorar!</p>
                </div>
                <div class="servicio-item">
                    <h4>Afeitado Clásico</h4>
                    <div id="carruselAfeitadoClasico" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../assets/AfeitadoClasico1.png" class="d-block w-100" alt="Afeitado Clásico 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/AfeitadoClasico2.png" class="d-block w-100" alt="Afeitado Clásico 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/AfeitadoClasico3.png" class="d-block w-100" alt="Afeitado Clasico 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselAfeitadoClasico" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselAfeitadoClasico" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                    <p>Afeitado tradicional con toalla caliente y productos exclusivos.</p>
                </div>
            </div>

            <!-- PRODUCTOS -->
            <section class="productos-section">
                <div class="productos-title">Nuestros Productos</div>
                <div class="productos-list">
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto1.png" alt="Producto 1">
                        <p>Pomada Fijadora</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto2.png" alt="Producto 2">
                        <p>Cera Mate</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto3.png" alt="Producto 3">
                        <p>Shampoo para Barba</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto4.png" alt="Producto 4">
                        <p>Aceite para Barba</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto5.png" alt="Producto 5">
                        <p>After Shave</p>
                    </div>
                </div>
            </section>

            <!-- VALORES DE LA BARBERÍA -->
            <section class="valores-section">
                <div class="valores-title">Nuestra Esencia y Valores</div>
                <div class="valores-list">
                    <div class="valor-box">
                        <i class="fas fa-gem"></i>
                        <h4>Calidad Premium</h4>
                        <p>Nos esforzamos por ofrecerte solo lo mejor en cada servicio y producto.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-heart"></i>
                        <h4>Atención Personalizada</h4>
                        <p>Cada cliente es único, por eso te asesoramos y cuidamos como mereces.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-users"></i>
                        <h4>Ambiente Familiar</h4>
                        <p>Un espacio donde te sentirás cómodo, relajado y parte de la familia B&L.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-star"></i>
                        <h4>Innovación y Tendencia</h4>
                        <p>Siempre a la vanguardia en estilos, técnicas y productos para ti.</p>
                    </div>
                </div>
            </section>

            <!-- TESTIMONIOS -->
            <section class="testimonios-section">
                <div class="testimonios-title">Lo que dicen nuestros clientes</div>
                <div class="testimonios-list">
                    <div class="testimonio-box">
                        "¡Excelente atención y los mejores cortes! Recomiendo Barbería B&L al 100%."
                        <div class="autor">- Luis G.</div>
                    </div>
                    <div class="testimonio-box">
                        "Ambiente súper cómodo y barberos profesionales. ¡Volveré siempre!"
                        <div class="autor">- Ricardo M.</div>
                    </div>
                    <div class="testimonio-box">
                        "Productos de calidad y un trato increíble. Mi barba nunca estuvo mejor."
                        <div class="autor">- Juan P.</div>
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-left">
                    <p><strong>Contacto:</strong> +51 997 259 085 / +51 950 758 586</p>
                    <p><strong>Dirección:</strong> Cdr 3. Calle Teselia, San Carlos, San Juan de Lurigancho</p>
                    <p><strong>Teléfono:</strong> (123) 456-7890</p>
                </div>
                <div class="footer-right">
                    <p>Cancelaciones con 24 horas de anticipación.</p>
                    <p>Reembolsos no disponibles.</p>
                    <p>Diseño web: "Los Terreneitor de San Carlos"</p>
                </div>
            </div>
            <div class="copyright">
                <p>© 2024 Barbería B&L. Todos los derechos reservados.</p>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
