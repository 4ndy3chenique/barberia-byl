package Users;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andy9
 */
@WebFilter("/*")  // Aplica el filtro a todas las rutas de la aplicación
public class SecurityHeadersFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización opcional
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse httpResp = (HttpServletResponse) response;

        // Cabeceras de seguridad recomendadas
        httpResp.setHeader("Content-Security-Policy", "default-src 'self'");
        httpResp.setHeader("X-Frame-Options", "DENY");
        httpResp.setHeader("X-Content-Type-Options", "nosniff");
        httpResp.setHeader("Referrer-Policy", "no-referrer");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Limpieza opcional
    }
}
