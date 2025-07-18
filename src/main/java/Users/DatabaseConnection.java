package Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    static {
        try {
            // Registrar el driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("No se pudo cargar el driver de MySQL");
        }
    }

    public static Connection getConnection() throws SQLException {
        try {
            String url = "jdbc:mysql://barberiabyl.mysql.database.azure.com:3306/bdbarberia?useSSL=true&requireSSL=false&serverTimezone=UTC";
            String user = "AdminBarberiaByL";
            String password = "BarberiaByL123";
            
            // Agregamos logging para debug
            System.out.println("Intentando conectar a la base de datos...");
            Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión exitosa!");
            
            return connection;
        } catch (SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
            e.printStackTrace();
            throw new SQLException("Error de conexión a la base de datos: " + e.getMessage());
        }
    }
}