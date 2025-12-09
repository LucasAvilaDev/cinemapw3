/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import entities.Reserva;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author Masterace
 */
@Stateless
public class ReservaFacade extends AbstractFacade<Reserva> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
public List<Reserva> buscarPorFuncion(int idFuncion) {
    return em.createQuery("SELECT r FROM Reserva r WHERE r.idFuncion.idFuncion = :id", Reserva.class)
             .setParameter("id", idFuncion)
             .getResultList();
}

    public ReservaFacade() {
        super(Reserva.class);
    }
    
}
