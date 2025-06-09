<%-- 
    Document   : reservas
    Created on : 19 oct. 2024, 10:53:58?a.�m.
    Author     : Micha
--%>
<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Servicios | Barber�a B&L</title>
        <link rel="stylesheet" href="../css/reservas.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header style="display: flex; flex-direction: row;">  
            <div class="logo">
                <img src="../../assets/logo.png" alt="Barber�a B&L Logo">
                <h1 style="font-size: 35px !important;">Barber�a B&L</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index_user.jsp">Inicio</a></li>
                    <li><a href="servicios.jsp">Servicios</a></li>
                    <li><a href="productos.jsp">Productos</a></li>
                    <li><a href="sedes.jsp">Sedes</a></li>
                    <li><a href="reservas.jsp">Reservas</a></li>
                </ul>
            </nav>
            <div style="display: flex; flex-direction: row;" class="user-icon">
                <a href="<%= request.getContextPath()%>/logout" 
                   class="nav-link" 
                   onclick="return confirm('�Est�s seguro de que deseas cerrar sesi�n?');">
                    <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                </a>

                <img src="../../assets/user-icon.png" alt="User Icon">
            </div>
        </header>
        <main>
            <section class="reserva-form">
                <h2>Reserva tu cita</h2>
                <form id="reserva-form">
                    <div class="form-group">
                        <label for="nombre">Nombre completo:</label>
                        <input type="text" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Tel�fono:</label>
                        <input type="tel" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Correo electr�nico:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha">Fecha de la cita:</label>
                        <input type="date" id="fecha" name="fecha" required>
                    </div>
                    <div class="form-group">
                        <label for="hora">Hora de la cita:</label>
                        <input type="time" id="hora" name="hora" required>
                    </div>
                    <div class="form-group">
                        <label for="servicio">Servicio:</label>
                        <select id="servicio" name="servicio" required>
                            <option value="">Selecciona un servicio</option>
                            <option value="corte">Corte de cabello</option>
                            <option value="afeitado">Afeitado</option>
                            <option value="coloracion">Coloraci�n</option>
                            <option value="tratamiento">Tratamiento capilar</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="barbero">Barbero (opcional):</label>
                        <select id="barbero" name="barbero">
                            <option value="">Selecciona un barbero (opcional)</option>
                            <option value="juan">Juan</option>
                            <option value="pedro">Pedro</option>
                            <option value="maria">Mar�a</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="comentarios">Comentarios adicionales:</label>
                        <textarea id="comentarios" name="comentarios" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn-reservar">Reservar cita</button>
                </form>
            </section>
        </main>
        <footer>
            <div class="footer-content">
                <div class="footer-left">
                    <p>Contacto: +51 997 259 085 / +51 950 758 586</p>
                    <p>Direcci�n: Cdr 3. Calle Teselia, San carlos,San Juan de Lurigancho</p>
                    <p>Tel�fono: (123) 456-7890</p>
                </div>
                <div class="footer-right">
                    <p>Cancelaciones con 24 horas de anticipaci�n.</p>
                    <p>Reembolsos no disponibles.</p>
                    <p>Dise�o web: "Los Terreneitor de San Carlos"</p>
                </div>
            </div>
            <div class="copyright">
                <p>� 2024 Barber�a B&L. Todos los derechos reservados.</p>
            </div>
        </footer>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
