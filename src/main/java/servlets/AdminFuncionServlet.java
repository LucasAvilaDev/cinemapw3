package servlets;


import entities.Funcion;
import entities.Pelicula;
import entities.Usuario;
import facade.FuncionFacade;
import facade.PeliculaFacade;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminFuncionServlet", urlPatterns = {"/AdminFunciones"})
public class AdminFuncionServlet extends HttpServlet {

    @EJB private FuncionFacade funcionFacade;
    @EJB private PeliculaFacade peliculaFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!esAdmin(request)) { response.sendRedirect("Peliculas"); return; }

        String action = request.getParameter("action");
        
        if (action == null) {
            request.setAttribute("lista", funcionFacade.findAll());
            request.getRequestDispatcher("admin/lista_funciones.jsp").forward(request, response);
            
        } else if (action.equals("new") || action.equals("edit")) {
            List<Pelicula> peliculas = peliculaFacade.findAll();
            request.setAttribute("listaPeliculas", peliculas);
            
            if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("funcion", funcionFacade.find(id));
            }
            request.getRequestDispatcher("admin/form_funcion.jsp").forward(request, response);
            
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Funcion f = funcionFacade.find(id);
            if(f != null) funcionFacade.remove(f);
            response.sendRedirect("AdminFunciones");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!esAdmin(request)) return;

        try {
            String idStr = request.getParameter("id");
            int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            // Formato datetime-local de HTML5: "2023-12-01T18:00"
            String fechaStr = request.getParameter("fechaHora"); 
            BigDecimal precio = new BigDecimal(request.getParameter("precio"));

            // Convertir String a Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date fecha = sdf.parse(fechaStr);

            Funcion f = new Funcion();
            if (idStr != null && !idStr.isEmpty()) {
                f = funcionFacade.find(Integer.parseInt(idStr));
            }

            f.setPrecio(precio);
            f.setFechaHora(fecha);
            Pelicula p = peliculaFacade.find(idPelicula);
            f.setIdPelicula(p);

            if (idStr == null || idStr.isEmpty()) funcionFacade.create(f);
            else funcionFacade.edit(f);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("AdminFunciones");
    }

    private boolean esAdmin(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        Usuario u = (session != null) ? (Usuario) session.getAttribute("usuarioLogueado") : null;
        return u != null && "ADMIN".equals(u.getRol());
    }
}