package Users;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CitaServlet", urlPatterns = {"/CitaServlet"})
public class CitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        CitaDAO citaDAO = new CitaDAO();

        try {
            if (accion != null) {
                if (accion.equals("crear")) {
                    String empleado = request.getParameter("empleado");
                    String servicio = request.getParameter("servicio");
                    String sede = request.getParameter("sede");
                    String fechaStr = request.getParameter("fecha");
                    String horaInicioStr = request.getParameter("horaInicio");
                    String horaFinStr = request.getParameter("horaFin");

                    if (fechaStr == null || horaInicioStr == null || horaFinStr == null ||
                        fechaStr.trim().isEmpty() || horaInicioStr.trim().isEmpty() || horaFinStr.trim().isEmpty()) {
                        throw new IllegalArgumentException("Fecha u hora no pueden estar vacías");
                    }

                    Date fecha = Date.valueOf(fechaStr);
                    Time horaInicio = validateAndConvertTime(horaInicioStr);
                    Time horaFin = validateAndConvertTime(horaFinStr);
                    String clienteNombre = request.getParameter("clienteNombre");
                    String estado = request.getParameter("estado");

                    Cita nuevaCita = new Cita(
                        0, empleado, servicio, sede, fecha,
                        horaInicio, horaFin, clienteNombre, estado
                    );

                    citaDAO.create(nuevaCita);
                    response.sendRedirect(request.getContextPath() + "/Administrador/pages/citas.jsp");

                } else if (accion.equals("actualizar")) {
                    int idCita = Integer.parseInt(request.getParameter("idCita"));
                    String empleado = request.getParameter("empleado");
                    String servicio = request.getParameter("servicio");
                    String sede = request.getParameter("sede");
                    Date fecha = Date.valueOf(request.getParameter("fecha"));
                    Time horaInicio = validateAndConvertTime(request.getParameter("horaInicio"));
                    Time horaFin = validateAndConvertTime(request.getParameter("horaFin"));
                    String clienteNombre = request.getParameter("clienteNombre");
                    String estado = request.getParameter("estado");

                    Cita citaActualizar = new Cita(
                        idCita, empleado, servicio, sede, fecha,
                        horaInicio, horaFin, clienteNombre, estado
                    );

                    citaDAO.update(citaActualizar);
                    response.sendRedirect(request.getContextPath() + "/Administrador/pages/citas.jsp");

                } else if (accion.equals("eliminar")) {
                    int idCita = Integer.parseInt(request.getParameter("idCita"));
                    citaDAO.delete(idCita);
                    response.sendRedirect(request.getContextPath() + "/Administrador/pages/citas.jsp");

                } else {
                    response.sendRedirect(request.getContextPath() + "/error.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }

        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("errorMensaje", "Error en los datos ingresados: " + e.getMessage());
            request.getRequestDispatcher("/Administrador/pages/citas.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMensaje", "Ocurrió un error inesperado: " + e.getMessage());
            request.getRequestDispatcher("/Administrador/pages/citas.jsp").forward(request, response);
        }
    }

    private Time validateAndConvertTime(String timeStr) {
        if (timeStr == null || timeStr.trim().isEmpty()) {
            throw new IllegalArgumentException("La hora no puede estar vacía");
        }

        if (!timeStr.matches("\\d{2}:\\d{2}")) {
            throw new IllegalArgumentException("Formato de hora inválido. Use HH:MM");
        }

        return Time.valueOf(timeStr + ":00");
    }
}
