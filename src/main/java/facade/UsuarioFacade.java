/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import entities.Usuario;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author Masterace
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public Usuario validarUsuario(String email, String password) {
        try {
            Usuario u = (Usuario) em.createNamedQuery("Usuario.findByEmail")
                                    .setParameter("email", email)
                                    .getSingleResult();
            
            if (u != null && u.getPassword().equals(password)) {
                return u;
            }
        } catch (Exception e) {
            return null; 
        }
        return null;
    }

    public boolean existeEmail(String email) {
        List<Usuario> lista = em.createNamedQuery("Usuario.findByEmail")
                                .setParameter("email", email)
                                .getResultList();
        return !lista.isEmpty();
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
}
