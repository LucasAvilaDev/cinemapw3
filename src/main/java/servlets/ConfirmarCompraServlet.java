package servlets;


import entities.Funcion;
import entities.Reserva;
import entities.Usuario;
import facade.FuncionFacade;
import facade.ReservaFacade;
import java.io.IOException;
import java.util.Date;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ConfirmarCompraServlet", urlPatterns = {"/ConfirmarCompra"})
public class ConfirmarCompraServlet extends HttpServlet {

    @EJB
    private ReservaFacade reservaFacade;
    @EJB
    private FuncionFacade funcionFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Usuario usuarioLogueado = (session != null) ? (Usuario) session.getAttribute("usuarioLogueado") : null;
        
        if (usuarioLogueado == null) {
            request.setAttribute("error", "Debes iniciar sesión.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String idFuncionStr = request.getParameter("idFuncion");
        String[] asientosSeleccionados = request.getParameterValues("asientos"); // Array ["A-1", "B-2"]
        
        if (idFuncionStr != null && asientosSeleccionados != null && asientosSeleccionados.length > 0) {
            try {
                int idFuncion = Integer.parseInt(idFuncionStr);
                Funcion funcion = funcionFacade.find(idFuncion);
                
                List<Reserva> reservasConfirmadas = new ArrayList<>();
                BigDecimal totalPagado = BigDecimal.ZERO;
                
                for (String asientoRaw : asientosSeleccionados) {
                    String[] partes = asientoRaw.split("-");
                    String fila = partes[0];
                    int numero = Integer.parseInt(partes[1]);
                    
                    Reserva r = new Reserva();
                    r.setFila(fila);
                    r.setNumero(numero);
                    r.setFechaReserva(new Date());
                    r.setPrecioFinal(funcion.getPrecio());
                    r.setIdFuncion(funcion);
                    r.setIdUsuario(usuarioLogueado);
                    
                    reservaFacade.create(r);
                    
                    reservasConfirmadas.add(r);
                    totalPagado = totalPagado.add(funcion.getPrecio());
                }
                
                request.setAttribute("listaReservas", reservasConfirmadas);
                request.setAttribute("totalPagado", totalPagado);
                request.setAttribute("funcion", funcion);
                
                request.getRequestDispatcher("exito.jsp").forward(request, response);
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error procesando la compra. Es posible que un asiento ya fuera reservado.");
                response.sendRedirect("SeleccionButaca?idFuncion=" + idFuncionStr);
            }
        } else {
            response.sendRedirect("SeleccionButaca?idFuncion=" + idFuncionStr);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
