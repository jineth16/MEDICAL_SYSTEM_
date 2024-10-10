
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import logica.Usuario;


public class UsuarioJpaController implements Serializable {
    
    private EntityManagerFactory emf = null;
    
    public UsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public UsuarioJpaController() {
        
        emf = Persistence.createEntityManagerFactory("persistence_JPU");
    }
    
    // Funcion encargada de crear un usuario
    public void create(Usuario usuario) {
        
        EntityManager em = getEntityManager();
        
        try {
            
            em.getTransaction().begin();
            em.persist(usuario);
            em.getTransaction().commit();
            
        } finally {
            
            if (em != null) {
                
                em.close();
                
            }
        }
        
    }
    
    // Funcion encargada de listat usuarios
    public List<Usuario> list(){
        
        EntityManager em = getEntityManager();
        
        try {
            
            return em.createQuery(
                "SELECT u FROM Usuario u WHERE u.estado = 1", 
                Usuario.class
            ).getResultList();
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
             
        }
    }
    
    
    // Funcion encargada de listar por rol
    public List<Usuario> listByRol(String rol){
        
        EntityManager em = getEntityManager();
        
        try {
            
            // query.setParameter("rol", rol);
            
            return em.createQuery(
                "SELECT u FROM Usuario u WHERE u.rol = :rol AND u.estado = 1", 
                Usuario.class
            ).getResultList();
            
            
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
             
        }
    }
    
    // funcion encargada de validar un usuario y llevarlo al home
    public Usuario login(String email, String password) {
        
        EntityManager em = getEntityManager();
        
        try {
            
            TypedQuery<Usuario> query = em.createQuery(
                "SELECT u FROM Usuario u WHERE u.correo = :correo AND u.contraseña = :password", 
                Usuario.class
            );
            
            query.setParameter("correo", email);
            query.setParameter("password", password);
            
            return query.getSingleResult();
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    
    // Funcion encargada de eliminar una cita por id
    public Usuario delete (Integer Id) {
        
        EntityManager em = getEntityManager();
            
        String sql = "DELETE u FROM Usuario u WHERE u.id = ?";

        em.getTransaction().begin();
        em.createNativeQuery(sql).setParameter(1, Id).executeUpdate();
        // Ejecuta la actualización
        em.getTransaction().commit();

        em.close();

        return null;
    }
    
    // Funcion para obtener un usuario mediante id
    public Usuario getUsuarioById(Integer Id) {
        
        EntityManager em = getEntityManager();
        
        try {
            
            TypedQuery<Usuario> query = em.createQuery(
                "SELECT u FROM Usuario u WHERE u.id = :Id", 
                Usuario.class
            );
            
            query.setParameter("Id", Id);
            
            return query.getSingleResult();
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
             
        }
    }
    
    // Funcion encargada de editar un usuario 
    public List<Usuario> edit (Usuario usuario) {
    
        EntityManager em = getEntityManager();
        
        String sql = "UPDATE usuario u SET u.id = ? , u.nombre = ? , "
        + " u.apellido = ?, u.correo = ?, u.rol = ?, u.contraseña = ? , "
        + " u.estado = ? "
        + " WHERE u.id = ? ";
        
        em.getTransaction().begin();
        
        em.createNativeQuery(sql)
        .setParameter(1, usuario.getId())
        .setParameter(2, usuario.getNombre())
        .setParameter(3, usuario.getApellido())
        .setParameter(4, usuario.getCorreo())
        .setParameter(5, usuario.getRol())
        .setParameter(6, usuario.getContraseña())
        .setParameter(7, usuario.getEstado()).executeUpdate();
        
        // Ejecuta la actualización
        em.getTransaction().commit();
        
        em.close();
        
        return null;
    
    }
}
