package servlets;


import entities.Pelicula;
import facade.PeliculaFacade;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


// Definimos la URL con la que se llamará a este Servlet
@WebServlet(name = "PeliculaServlet", urlPatterns = {"/Peliculas"}) 
public class PeliculaServlet extends HttpServlet {

    @EJB
    private PeliculaFacade peliculaFacade;

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String busqueda = request.getParameter("buscar");
    List<Pelicula> listaPeliculas;
    
    if (busqueda != null && !busqueda.trim().isEmpty()) {
        listaPeliculas = peliculaFacade.buscarPorTitulo(busqueda);
    } else {
        listaPeliculas = peliculaFacade.findAll();
    }
    
    request.setAttribute("misPeliculas", listaPeliculas);
    request.getRequestDispatcher("listaPeliculas.jsp").forward(request, response);
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}