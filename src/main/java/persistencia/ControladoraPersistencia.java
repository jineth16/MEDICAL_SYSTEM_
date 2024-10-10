package persistencia;

import java.util.List;
import logica.Citas;
import logica.Usuario;

public class ControladoraPersistencia {
    
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    CitasJpaController citasJPA = new CitasJpaController();
    
    // [MODULO USUARIO] Crear usuario metodo
    public void CrearUsuario(Usuario usu) {
        
        usuarioJPA.create(usu);
        
    }
    
    // [MODULO USUARIO] Listar Usuarios
    public void ListarUsuarioRol(String rol) {
        
        usuarioJPA.listByRol(rol);
        
    }
        
    // [MODULO USUARIO] Listar usuarios todos
    public List<Usuario> ListarUsuario() {
        
        return usuarioJPA.list();
        
    }
    
    
    // [MODULO USUARIO] Login Check / validacion de login
    public Usuario LoginCheck(String email, String password) {
        
        return usuarioJPA.login(email, password);
     
    }
    
    // [MODULO Usuario] Eliminar Usuario
    public void EliminarUsuarios(Integer Id){
        
        usuarioJPA.delete(Id);
        
    }
    
    public Usuario getUsuarios(Integer Id) {
        
        return usuarioJPA.getUsuarioById(Id);
        
    }
    
    // Obtener usuario x id
    public Usuario getUsuariosById(Integer Id) {
        
        return usuarioJPA.getUsuarioById(Id);
        
    }
    
    // [MODULO USUARIO] Editar usuario
    public void EditarUsuarios(Usuario usu) {
        
        usuarioJPA.edit(usu);
        
    }
    
    // [MODULO CITAS] Crear Citas
    public void CrearCitas(Citas cita){
        
        citasJPA.create(cita);
        
    }
    
    // [MODULO CITAS] Listar Citas
        public List<Citas> ListarCitas(){
        
        return citasJPA.list();
        
    }
    
    // [MODULO CITA] Obtener info de una cita especifica
    public Citas getCitas(Integer Id){
        
        return citasJPA.getCitaById(Id);
        
    }
    
    // [MODULO CITA] Editar Cita
    public void EditarCitas(Citas cita){
        
        citasJPA.edit(cita);
        
    }
    
    // [MODULO CITA] Eliminar Cita
    public void EliminarCitas(Integer Id){
        
        citasJPA.delete(Id);
        
    }
}
