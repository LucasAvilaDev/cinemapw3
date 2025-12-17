/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import entities.Usuario;
import facade.UsuarioFacade;
import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Masterace
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login", "/Logout"})
public class LoginServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        
        if (path.equals("/Logout")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("Login");
            return;
        }

        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        if (email != null && pass != null) {
            Usuario user = usuarioFacade.validarUsuario(email, pass);
            
            if (user != null) {
                // ¡LOGIN EXITOSO!
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogueado", user); 
                
                // --- CAMBIO: RUTEO INTELIGENTE ---
                if ("ADMIN".equals(user.getRol())) {
                    response.sendRedirect("AdminHome"); // Admin -> Panel
                } else {
                    response.sendRedirect("Peliculas"); // Cliente -> Cartelera
                }
                
            } else {
                // ... manejo de error ...
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { processRequest(request, response); }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { processRequest(request, response); }
}