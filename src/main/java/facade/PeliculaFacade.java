/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import entities.Pelicula;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import java.util.List;

/**
 *
 * @author Masterace
 */
@Stateless
public class PeliculaFacade extends AbstractFacade<Pelicula> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public List<Pelicula> buscarPorTitulo(String tituloBusqueda) {
    CriteriaBuilder cb = em.getCriteriaBuilder();
    
    CriteriaQuery<Pelicula> cq = cb.createQuery(Pelicula.class);
    
    Root<Pelicula> p = cq.from(Pelicula.class);
   
    Predicate filtroNombre = cb.like(cb.lower(p.get("titulo")), "%" + tituloBusqueda.toLowerCase() + "%");
    
    cq.select(p).where(filtroNombre);
    
    return em.createQuery(cq).getResultList();
}

    public PeliculaFacade() {
        super(Pelicula.class);
    }
    
}
