package Users;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})

public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos el tipo de acción desde el formulario (creación, actualización, eliminación)
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        UsuarioDAO usuarioDAO = new UsuarioDAO(); // Instancia del DAO

        // Determinar qué acción realizar con base en el parámetro "accion"
        if (accion != null) {
            if (accion.equals("crear") || accion.equals("registrar")) {
                // Recolectar datos del formulario
                String nombre = request.getParameter("nombres");
                String apellido = request.getParameter("apellidos");
                String email = request.getParameter("correo");
                String numero = request.getParameter("numero");
                String contraseña = request.getParameter("contraseña");
                String genero = request.getParameter("genero");

                // Crear objeto Usuario
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setNombre(nombre);
                nuevoUsuario.setApellido(apellido);
                nuevoUsuario.setEmail(email);
                nuevoUsuario.setNumero(numero);
                nuevoUsuario.setContraseña(contraseña);  // Asegúrate de aplicar hash si lo implementas
                nuevoUsuario.setGenero(genero);

                // Guardar usuario en la base de datos
                usuarioDAO.create(nuevoUsuario);

                // Redirigir según el origen de la solicitud
                if (accion.equals("registrar")) {
                    response.sendRedirect("index.jsp");  // Desde modal de registro hacia el index principal
                } else {
                    response.sendRedirect("Administrador/pages/usuarios.jsp");  // Desde panel de admin hacia el pandel del admin
                }
            } else if (accion.equals("actualizar")) {
                // Datos del formulario para actualizar un usuario
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombres");
                String apellido = request.getParameter("apellidos");
                String email = request.getParameter("correo");
                String numero = request.getParameter("numero");
                String contraseña = request.getParameter("contraseña");
                String genero = request.getParameter("genero");

                // Crear un objeto Usuario y llenarlo con los datos
                Usuario usuarioActualizar = new Usuario();
                usuarioActualizar.setId(id);
                usuarioActualizar.setNombre(nombre);
                usuarioActualizar.setApellido(apellido);
                usuarioActualizar.setEmail(email);
                usuarioActualizar.setNumero(numero);
                usuarioActualizar.setContraseña(contraseña);  // Asegúrate de hashificar la contraseña
                usuarioActualizar.setGenero(genero);

                // Llamar al método de actualizar usuario
                usuarioDAO.update(usuarioActualizar);

                // Redirigir a una página de éxito
                response.sendRedirect(request.getContextPath() + "/Administrador/pages/usuarios.jsp");


            } else if (accion.equals("eliminar")) {
                // Obtener el ID del usuario a eliminar
                int id = Integer.parseInt(request.getParameter("id"));

                // Llamar al método de eliminar usuario
                usuarioDAO.delete(id);

                // Redirigir a una página de éxito
                response.sendRedirect(request.getContextPath() + "/Administrador/pages/usuarios.jsp");

            } else {
                // Si no se encuentra una acción válida
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}