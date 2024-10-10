package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
 
public class Pacientes implements Serializable {
    
    @Id
    @GeneratedValue (strategy=GenerationType.AUTO)
    private Integer id;
    
    public Pacientes() {
    }
    
    public Pacientes(Integer id) {
        this.id = id;
    }
    
    
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
}
