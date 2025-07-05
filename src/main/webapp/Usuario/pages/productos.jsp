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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/Usuario/css/productos.css">
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
                <div class="masthead-subheading">¡Nuestros Productos!</div>
                <div class="masthead-heading text-uppercase">
                    Descubre todos los productos que tenemos para ti en BYL
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
                        <h1 class="display-5 fw-bold">Bienvenido a nuestra Tienda</h1>
                        <p class="fs-4">
                            Descubre en nuestra tienda una cuidada selección de productos premium para el cabello, barba y piel, diseñados especialmente para realzar tu estilo y mantener tu look impecable cada día. En Barbería BYL, tu imagen es nuestra prioridad.
                        </p>
                        <a class="btn btn-primary btn-lg" href="carrito.jsp">Ir al carrito</a>
                    </div>
                </div>
            </div>
        </header>

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto1.png" alt="Pomada para cabello" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Pomada para Cabello</h5>
                                    S/. 45.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Oferta</div>
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto2.png" alt="Cera para Barba" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Cera para Barba</h5>
                                    <span class="text-muted text-decoration-line-through">S/. 35.00</span>
                                    S/. 30.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto3.png" alt="Shampoo para Hombre" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Shampoo para Hombre</h5>
                                    S/. 25.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto4.png" alt="After Shave" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">After Shave</h5>
                                    S/. 28.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Oferta</div>
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto5.png" alt="Peine de Madera" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Peine de Madera</h5>
                                    <span class="text-muted text-decoration-line-through">S/. 15.00</span>
                                    S/. 12.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto6.png" alt="Aceite para Barba" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Aceite para Barba</h5>
                                    S/. 32.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto7.png" alt="Aceite para Barba" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Aceite para Barba</h5>
                                    S/. 32.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%= request.getContextPath()%>/assets/servicios-producto8.png" alt="Aceite para Barba" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Aceite para Barba</h5>
                                    S/. 32.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
