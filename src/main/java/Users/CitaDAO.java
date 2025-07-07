package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CitaDAO implements DAO<Cita> {

    // Método para crear una nueva cita
    @Override
    public void create(Cita cita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            // Asegúrate de que los nombres de las columnas coincidan exactamente con tu tabla
            String query = "INSERT INTO citas (empleado, servicio, sede, fecha, hora_inicio, hora_fin, cliente_nombre, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, cita.getEmpleado());
            sentencia.setString(2, cita.getServicio());
            sentencia.setString(3, cita.getSede());
            sentencia.setDate(4, cita.getFecha());
            sentencia.setTime(5, cita.getHoraInicio());
            sentencia.setTime(6, cita.getHoraFin());
            sentencia.setString(7, cita.getClienteNombre());
            sentencia.setString(8, cita.getEstado());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
            System.out.println("Cita creada exitosamente para: " + cita.getClienteNombre()); // Para depuración
        } catch (SQLException e) {
            System.out.println("Error al insertar cita: " + e.getMessage());
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error al insertar cita", e); // Log más detallado
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error de clase no encontrada al conectar a la BD", ex);
        }
    }

    // Método para actualizar una cita existente
    @Override
    public void update(Cita cita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE citas SET empleado = ?, servicio = ?, sede = ?, fecha = ?, hora_inicio = ?, hora_fin = ?, cliente_nombre = ?, estado = ? WHERE id_cita = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, cita.getEmpleado());
            sentencia.setString(2, cita.getServicio());
            sentencia.setString(3, cita.getSede());
            sentencia.setDate(4, cita.getFecha());
            sentencia.setTime(5, cita.getHoraInicio());
            sentencia.setTime(6, cita.getHoraFin());
            sentencia.setString(7, cita.getClienteNombre());
            sentencia.setString(8, cita.getEstado());
            sentencia.setInt(9, cita.getIdCita());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
            System.out.println("Cita actualizada exitosamente para ID: " + cita.getIdCita()); // Para depuración
        } catch (SQLException e) {
            System.out.println("Error al actualizar cita: " + e.getMessage());
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error al actualizar cita", e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error de clase no encontrada al conectar a la BD", ex);
        }
    }

    // Método para eliminar una cita por su ID
    public void delete(int idCita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM citas WHERE id_cita = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, idCita);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
            System.out.println("Cita eliminada exitosamente para ID: " + idCita); // Para depuración
        } catch (SQLException e) {
            System.out.println("Error al eliminar cita: " + e.getMessage());
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error al eliminar cita", e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error de clase no encontrada al conectar a la BD", ex);
        }
    }

    // Método para listar todas las citas
    @Override
    public LinkedList<Cita> list() {
        LinkedList<Cita> citas = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM citas ORDER BY fecha DESC, hora_inicio ASC"; // Ordenar para mejor visualización
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Cita cita = new Cita(
                    resultado.getInt("id_cita"),
                    resultado.getString("empleado"),
                    resultado.getString("servicio"),
                    resultado.getString("sede"),
                    resultado.getDate("fecha"),
                    resultado.getTime("hora_inicio"),
                    resultado.getTime("hora_fin"),
                    resultado.getString("cliente_nombre"),
                    resultado.getString("estado")
                );
                citas.add(cita);
            }

            resultado.close();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas: " + e.getMessage());
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error al listar citas", e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, "Error de clase no encontrada al conectar a la BD", ex);
        }
        return citas;
    }

    @Override
    public void delete(String codigo) {
        // Este método no se usa, pero se mantiene por la interfaz DAO<Cita>
        throw new UnsupportedOperationException("Not supported yet.");
    }
}