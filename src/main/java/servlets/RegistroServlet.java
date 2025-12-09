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

/**
 *
 * @author Masterace
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/Registro"})
public class RegistroServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        if (nombre != null && email != null && pass != null) {
            
            if (usuarioFacade.existeEmail(email)) {
                request.setAttribute("error", "Ese email ya está registrado.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }
            
            Usuario nuevo = new Usuario();
            nuevo.setNombre(nombre);
            nuevo.setEmail(email);
            nuevo.setPassword(pass);
            nuevo.setRol("CLIENTE");
            
            usuarioFacade.create(nuevo);
            
            request.setAttribute("mensaje", "Cuenta creada. Por favor inicia sesión.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } else {
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { processRequest(request, response); }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { processRequest(request, response); }
}
