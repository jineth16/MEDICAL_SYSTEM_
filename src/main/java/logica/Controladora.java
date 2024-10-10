package logica;

import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    // [MODULO USUARIO] Crear usuario metodo
    public void CrearUsuario(Usuario usu) {
        
        controlPersis.CrearUsuario(usu);
        
    }
    
    // [MODULO USUARIO] Listar todos los usuarios activos
    public List<Usuario> ListarUsuario() {
        
        return controlPersis.ListarUsuario();
        
    }
            
    // [MODULO USUARIO] Obtener una lista de usuarios tipo 3 (Medicos)
    public void ListarUsuarioRol(String rol) {

        controlPersis.ListarUsuarioRol(rol);

    }
    
    // [MODULO USUARIO] Validar login
    public Usuario LoginCheck(String email, String password) {
        
        return controlPersis.LoginCheck(email, password);
        
    }
    
    // [MODULO Usuario] Eliminar Usuario
    public void EliminarUsuario(Integer Id){
        
        controlPersis.EliminarUsuarios(Id);
        
    }
    
    
    // [MODULO USUARIO] Editar usuario
    public void EditarUsuario(Usuario usu) {
        
        controlPersis.EditarUsuarios(usu);
        
    }
    
    // Obtener usuario x id
    public Usuario getUsuarioById(Integer Id) {
        
        return controlPersis.getUsuariosById(Id);
        
    }
    
    
    // [MODULO CITA] Obtener info de un usuario especifico
    public Usuario getUsuario(Integer Id){
        
        return controlPersis.getUsuarios(Id);
        
    }
    
    // [MODULO CITA] Crear Cita
    public void CrearCita(Citas cita){
        
        controlPersis.CrearCitas(cita);
        
    }
    
    // [MODULO CITA] Listar Citas
    public List<Citas> ListarCita(){
        
        return controlPersis.ListarCitas();
        
    }
    
    // [MODULO CITA] Obtener info de una cita especifica
    public Citas getCita(Integer Id){
        
        return controlPersis.getCitas(Id);
        
    }
    
    // [MODULO CITA] Editar Cita
    public void EditarCita(Citas cita){
        
        controlPersis.EditarCitas(cita);
        
    }
    
    // [MODULO CITA] Eliminar Cita
    public void EliminarCita(Integer Id){
        
        controlPersis.EliminarCitas(Id);
        
    }
}
