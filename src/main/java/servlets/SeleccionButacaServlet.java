/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import entities.Funcion;
import entities.Reserva;
import facade.FuncionFacade;
import facade.ReservaFacade;
import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.IO.print;
import java.util.List;

/**
 *
 * @author Masterace
 */
@WebServlet(name = "SeleccionButacaServlet", urlPatterns = {"/Butacas"})
public class SeleccionButacaServlet extends HttpServlet {

    @EJB
    private ReservaFacade reservaFacade;
    @EJB
    private FuncionFacade funcionFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        
        if (idStr != null) {
            int idFuncion = Integer.parseInt(idStr);
            
            Funcion funcion = funcionFacade.find(idFuncion);
            
            List<Reserva> reservasOcupadas = reservaFacade.buscarPorFuncion(idFuncion);
            
            request.setAttribute("funcionDatos", funcion);
            request.setAttribute("ocupadas", reservasOcupadas);
            
            request.getRequestDispatcher("seleccionButaca.jsp").forward(request, response);
        } else {
            response.sendRedirect("Peliculas");
        }
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
