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
 * Filtro para agregar cabeceras de seguridad HTTP
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

        // ✅ Content Security Policy ajustada con tus CDNs
        httpResp.setHeader("Content-Security-Policy",
                "default-src 'self'; " +
                "script-src 'self' https://cdn.jsdelivr.net https://use.fontawesome.com; " +
                "style-src 'self' https://cdn.jsdelivr.net https://use.fontawesome.com; " +
                "font-src 'self' https://cdn.jsdelivr.net https://use.fontawesome.com; " +
                "img-src 'self'; " +
                "frame-ancestors 'none'");

        // ✅ Anti-clickjacking
        httpResp.setHeader("X-Frame-Options", "DENY");

        // ✅ Deshabilitar MIME sniffing
        httpResp.setHeader("X-Content-Type-Options", "nosniff");

        // ✅ Política de referencia
        httpResp.setHeader("Referrer-Policy", "no-referrer");

        // ✅ (Opcional) HSTS si tu app usa solo HTTPS
        // httpResp.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Limpieza opcional
    }
}
