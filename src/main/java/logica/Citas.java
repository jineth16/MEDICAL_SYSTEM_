package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Citas implements Serializable {
    
    @Id
    @GeneratedValue (strategy=GenerationType.AUTO)
    private Integer id;
    private String sede;
    private String nombreCompleto;
    private String correo;
    private String telefono;
    private String cedula;
    private String notas;
    private Integer estado;
    private String fecha;
    private String hora;
    private String creacion;

    
    public Citas() {
    }
    
    public Citas(Integer id, String sede, String nombreCompleto, String notas,
    Integer estado, String fecha, String hora, String creacion,
    String correo, String telefono, String cedula) {
        this.id = id;
        this.sede = sede;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.telefono = telefono;
        this.cedula = cedula;
        this.notas = notas;
        this.estado = estado;
        this.fecha = fecha;
        this.hora = hora;
        this.creacion = creacion;
        
    }
    
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }
    
    public String getSede() {
        return sede;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }
    
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    
    public String getNotas() {
        return notas;
    }
    
    public void setNotas(String notas) {
        this.notas = notas;
    }
    
    public Integer getEstado() {
        return estado;
    }
    
    public void setEstado(Integer estado) {
        this.estado = estado;
    }
    

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    public String getCreacion() {
        return creacion;
    }

    public void setCreacion(String creacion) {
        this.creacion = creacion;
    }
    
}