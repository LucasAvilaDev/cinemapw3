package com.cine.controlador;

import entities.Pelicula;
import entities.Usuario;
import facade.PeliculaFacade;
import java.io.IOException;
import java.util.List;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminPeliculaServlet", urlPatterns = {"/AdminPeliculas"})
public class AdminPeliculaServlet extends HttpServlet {

    @EJB
    private PeliculaFacade peliculaFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!esAdmin(request)) {
            response.sendRedirect("Peliculas");
            return;
        }

        String action = request.getParameter("action");
        
        if (action == null) {
            // LISTAR
            List<Pelicula> lista = peliculaFacade.findAll();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/lista_peliculas.jsp").forward(request, response);
            
        } else if (action.equals("new")) {
            request.getRequestDispatcher("admin/form_pelicula.jsp").forward(request, response);
            
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Pelicula p = peliculaFacade.find(id);
            request.setAttribute("pelicula", p);
            request.getRequestDispatcher("admin/form_pelicula.jsp").forward(request, response);
            
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Pelicula p = peliculaFacade.find(id);
            if (p != null) peliculaFacade.remove(p);
            response.sendRedirect("AdminPeliculas");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!esAdmin(request)) return; // Seguridad

        String idStr = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        String sinopsis = request.getParameter("sinopsis");

        Pelicula p = new Pelicula();
        
        if (idStr != null && !idStr.isEmpty()) {
            p = peliculaFacade.find(Integer.parseInt(idStr)); // Traemos la original
        }
        
        p.setTitulo(titulo);
        p.setGenero(genero);
        p.setDuracion(duracion);
        p.setSinopsis(sinopsis);

        if (idStr == null || idStr.isEmpty()) {
            peliculaFacade.create(p);
        } else {
            peliculaFacade.edit(p);
        }

        response.sendRedirect("AdminPeliculas");
    }

    private boolean esAdmin(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        Usuario u = (session != null) ? (Usuario) session.getAttribute("usuarioLogueado") : null;
        return u != null && "ADMIN".equals(u.getRol());
    }
}