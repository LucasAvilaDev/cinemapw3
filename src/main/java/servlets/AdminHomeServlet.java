package servlets;


import entities.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminHomeServlet", urlPatterns = {"/AdminHome"})
public class AdminHomeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. SEGURIDAD: Verificar sesión y Rol
        HttpSession session = request.getSession(false);
        Usuario u = (session != null) ? (Usuario) session.getAttribute("usuarioLogueado") : null;
        
        if (u == null || !"ADMIN".equals(u.getRol())) {
            // Si no es admin, lo mandamos a la vista de clientes
            response.sendRedirect("Peliculas");
            return;
        }

        // 2. Mostrar el Dashboard
        request.getRequestDispatcher("admin/home_admin.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { processRequest(req, resp); }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { processRequest(req, resp); }
}