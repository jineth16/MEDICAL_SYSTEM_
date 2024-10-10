package persistencia;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import logica.Citas;

public class CitasJpaController implements Serializable {
    
    private EntityManagerFactory emf = null;
    
    public CitasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public CitasJpaController() {
        
        emf = Persistence.createEntityManagerFactory("persistence_JPU");
    }
    
    // Funcion encargada de crear una cita
    public void create(Citas cita) {
        
        EntityManager em = getEntityManager();
        
        try {
            
            em.getTransaction().begin();
            em.persist(cita);
            em.getTransaction().commit();
            
        } finally {
            
            em.close();
        }
        
    }
    
    // Funcion encargada de listar las citas medicas
    public List<Citas> list () {
        
        EntityManager em = getEntityManager();
        
        try {
            
            return em.createQuery(
                "SELECT c FROM Citas c WHERE c.estado = 1", 
                Citas.class
            ).getResultList();
            
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
             
        }
    }
    
    // Funcion encargada de obtener la info de una cita por Id
    public Citas getCitaById (Integer Id){
        
        EntityManager em = getEntityManager();
        
        try {
            
            TypedQuery<Citas> query = em.createQuery(
                "SELECT c FROM Citas c WHERE c.id = :Id", 
                Citas.class
            );
            
            query.setParameter("Id", Id);
            
            return query.getSingleResult();
            
        } catch (NoResultException e) {
            
            return null;
            
        } finally {
            
            em.close();
             
        }
    }
    
    
    // Funcion encargada de editar una cita por Id
    public Citas edit(Citas cita) {
        
        EntityManager em = getEntityManager();
        
        String sql = "UPDATE citas c SET c.id = ? , c.nombreCompleto = ? , "
        + " c.correo = ? , c.telefono = ? , c.cedula = ? , c.notas = ? , "
        + " fecha = ? , c.hora = ? , c.sede = ? , c.estado = ? "
        + " WHERE c.id = ? ";
        
        em.getTransaction().begin();
        
        em.createNativeQuery(sql)
        .setParameter(1, cita.getId())
        .setParameter(2, cita.getNombreCompleto())
        .setParameter(3, cita.getCorreo())
        .setParameter(4, cita.getTelefono())
        .setParameter(5, cita.getCedula())
        .setParameter(6, cita.getNotas())
        .setParameter(7, cita.getFecha())
        .setParameter(8, cita.getHora())
        .setParameter(9, cita.getSede())
        .setParameter(10, cita.getEstado())
        .setParameter(11, cita.getId()).executeUpdate();
        
        // Ejecuta la actualización
        em.getTransaction().commit();
        
        em.close();
        
        return null;
        
    }
    
    // Funcion encargada de eliminar una cita por id
    public Citas delete (Integer Id) {
        
        EntityManager em = getEntityManager();
            
        String sql = "DELETE c FROM Citas c WHERE c.id = ?";

        em.getTransaction().begin();
        em.createNativeQuery(sql).setParameter(1, Id).executeUpdate();
        // Ejecuta la actualización
        em.getTransaction().commit();

        em.close();

        return null;
    }
}
