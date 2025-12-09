/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import entities.Funcion;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author Masterace
 */
@Stateless
public class FuncionFacade extends AbstractFacade<Funcion> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public List<Funcion> buscarPorPelicula(int id) {
        return em.createQuery("SELECT f FROM Funcion f WHERE f.idPelicula.idPelicula = :idParam", Funcion.class)
                .setParameter("idParam", id)
                .getResultList();
    }

    public FuncionFacade() {
        super(Funcion.class);
    }

}
