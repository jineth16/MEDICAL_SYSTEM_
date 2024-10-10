
package persistencia;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import logica.Pacientes;


public class PacientesJpaController implements Serializable {
    
    private EntityManagerFactory emf = null;
    
    public PacientesJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public PacientesJpaController() {
        
        emf = Persistence.createEntityManagerFactory("persistence_JPU");
    }
    
}
