package Users; // Make sure this package name matches your project structure

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CitaDAO citaDAO;

    // The init method is called once when the servlet is first loaded.
    // It's a good place to set up resources like DAOs.
    @Override
    public void init() throws ServletException {
        super.init(); // Always call super.init()
        citaDAO = new CitaDAO();
        // You might want to check if citaDAO is null or handle connection errors here
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("CitaServlet: Acción recibida - " + accion); // For debugging

        if (accion != null && accion.equals("crear")) {
            crearCita(request, response);
        } else {
            // Handle other actions or an error if 'accion' is not recognized
            System.out.println("CitaServlet: Acción no válida o no especificada.");
            request.setAttribute("errorMensaje", "Acción no válida o no especificada para la reserva.");
            // Redirect back to the same page with an error message
            request.getRequestDispatcher("/Usuario/pages/reservas.jsp").forward(request, response);
        }
    }

    private void crearCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String nombreCliente = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String fechaStr = request.getParameter("fecha");
            String horaInicioStr = request.getParameter("hora");
            String horaFinStr = request.getParameter("horaFin");
            String servicio = request.getParameter("servicio");
            String barbero = request.getParameter("barbero"); // This is 'empleado' in your DAO
            String sede = request.getParameter("sede");
            String comentarios = request.getParameter("comentarios");
            String estado = request.getParameter("estado"); // Expected to be "Pendiente" from JSP

            // Log received parameters for debugging
            System.out.println("CitaServlet: Parámetros de la cita - ");
            System.out.println("  Nombre: " + nombreCliente);
            System.out.println("  Fecha: " + fechaStr);
            System.out.println("  Hora Inicio: " + horaInicioStr);
            System.out.println("  Hora Fin: " + horaFinStr);
            System.out.println("  Servicio: " + servicio);
            System.out.println("  Barbero: " + barbero);
            System.out.println("  Sede: " + sede);
            System.out.println("  Estado: " + estado);

            // Convert String to java.sql.Date and java.sql.Time
            Date fecha = Date.valueOf(fechaStr);
            // Append seconds if your Time constructor expects it (e.g., "HH:mm:ss")
            Time horaInicio = Time.valueOf(horaInicioStr + ":00");
            Time horaFin = Time.valueOf(horaFinStr + ":00");

            // Create Cita object
            // IMPORTANT: Ensure your Cita constructor matches these parameters.
            // Based on your DAO, it should be something like:
            // Cita(int idCita, String empleado, String servicio, String sede, Date fecha, Time horaInicio, Time horaFin, String clienteNombre, String estado)
            // If you added telefono, email, or comentarios to Cita, adjust the constructor and DAO accordingly.
            Cita nuevaCita = new Cita(0, // id_cita is auto-generated in DB, so 0 for new
                                       barbero, // Maps to 'empleado' in DAO
                                       servicio,
                                       sede,
                                       fecha,
                                       horaInicio,
                                       horaFin,
                                       nombreCliente, // Maps to 'cliente_nombre' in DAO
                                       estado);

            // Attempt to create the appointment
            citaDAO.create(nuevaCita);

            // Set success message for the JSP
            request.setAttribute("successMensaje", "¡Cita reservada con éxito! Te esperamos.");
            System.out.println("CitaServlet: Cita creada exitosamente para " + nombreCliente);

            // Redirect back to the same /Usuario/pages/reservas.jsp page
            request.getRequestDispatcher("/Usuario/pages/reservas.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            // Catch formatting errors (e.g., invalid date or time format)
            request.setAttribute("errorMensaje", "Error en el formato de fecha u hora. Por favor, verifica los datos e intenta de nuevo.");
            Logger.getLogger(CitaServlet.class.getName()).log(Level.WARNING, "Error de formato al crear cita", e);
            System.err.println("CitaServlet: Error de formato: " + e.getMessage());
            request.getRequestDispatcher("/Usuario/pages/reservas.jsp").forward(request, response);
        } catch (Exception e) {
            // Catch any other unexpected errors during the appointment creation process
            request.setAttribute("errorMensaje", "Ocurrió un error inesperado al procesar tu reserva. Intenta de nuevo más tarde.");
            Logger.getLogger(CitaServlet.class.getName()).log(Level.SEVERE, "Error al crear cita", e);
            System.err.println("CitaServlet: Error general al crear cita: " + e.getMessage());
            request.getRequestDispatcher("/Usuario/pages/reservas.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If someone directly accesses CitaServlet with GET, just redirect them to the reservations page.
        // This prevents direct access to doPost logic via GET requests.
        response.sendRedirect(request.getContextPath() + "/Usuario/pages/reservas.jsp");
    }
}