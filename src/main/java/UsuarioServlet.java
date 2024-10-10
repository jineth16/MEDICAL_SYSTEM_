
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import logica.Citas;

import logica.Controladora;
import logica.Usuario;


@WebServlet(urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
    
    Controladora control = new Controladora();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     
    }
    
    // Aqui yo creo podremos traer la info de session
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        processRequest(request, response);
        String action = request.getParameter("dir");
        
        System.out.println("Accion => " + action);
        
        if (null == action) {
            
            // Acción por defecto si no se reconoce el parámetro
            listarUsuarios(request, response);
            
        } else switch (action) {
            
            case "list":
                
                // Código para listar todas las citas
                listarUsuarios(request, response);
                
            break;
            
            case "create":
                
                // Código para crear una nueva cita
                vistaCrearPersonal(request, response);
                
            break;
            
            case "edit":
            
                System.out.println("Editando Cita.. ");
                
                request.setAttribute("id", request.getParameter("id"));
                
                // Código para mostrar el formulario de editar cita
                obtenerVistaEditarUsuarios(request, response);
                
            break;
                
            case "info":
                
                // Código para buscar una cita especifica
                //infoCitas(request, response);
                
            break;
            
            case "delete":
                
                System.out.println("Eliminando Usuario.. ");

                request.setAttribute("id", request.getParameter("id"));
                
                // Código para buscar una cita especifica
                EliminarUsuario(request, response);
                
            break;
            
            default:
                
                // Acción por defecto si no se reconoce el parámetro
                listarUsuarios(request, response);
                
            break;
        }
        
    }

    
    // Creamos un usuario mediante metodo POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String action = request.getParameter("dir");
        System.out.println("Accion => " + action);
        
        if (null == action) {
            
            // Acción por defecto si no se reconoce el parámetro
            listarUsuarios(request, response);
            
        } else switch (action) {
            
            
            case "edit":
                
                // Codigo para guardar la cita
                System.out.println("Editando usuario por post ");
            
                // Código para listar todas las citas
                editarUsuarios(request, response);
                
            break;
            
            case "create":
                
                System.out.println("Creando usuario por post ");
                
                // Código para listar todas las citas
                crearUsuarios(request, response);
                
            break;

        }
        
    }
    
    private List<Usuario> listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
        // Lista de usuarios a retornar
        List<Usuario> listaUsuarios = control.ListarUsuario();
        
        request.setAttribute("usuarios", listaUsuarios);
        
        // Lógica para obtener la lista de citas y enviarlas a la vista
        request.getRequestDispatcher("/templates/backend/usuario/list.jsp").forward(request, response);
        
        return null;
        
    }
    
    private List<Usuario> crearUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
            
        // Obtenemos los valores del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        String rol = request.getParameter("rol");
        Integer estado = 1;

        // Creamos el objeto a guardar
        Usuario usu = new Usuario();

        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCorreo(correo);
        usu.setContraseña(pass);
        usu.setRol(rol);
        usu.setEstado(estado);

        // seteo y listo
        control.CrearUsuario(usu);

        String module = request.getParameter("module");
        
        if ("register".equals(module)) {

            // Formatear la fecha
            LocalDateTime fechaInicio = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String fechaFormateada = fechaInicio.format(formatter);

            // Crear la sesión
            HttpSession session = request.getSession();

            session.setAttribute("user_full_name", usu.getNombre() +' '+ usu.getApellido());
            session.setAttribute("user_role", usu.getRol());
            session.setAttribute("user_session_date", fechaFormateada);

            // Redirigir a home.jsp
            response.sendRedirect(request.getContextPath() + "/templates/backend/home.jsp");
            
        } else if ("user".equals(module)) {
            
            List<Usuario> listaUsuarios = control.ListarUsuario();
        
            request.setAttribute("usuarios", listaUsuarios);

            // Lógica para obtener la lista de citas y enviarlas a la vista
            request.getRequestDispatcher("/templates/backend/usuario/list.jsp").forward(request, response);

            return null;
                    
        }
        
        return null;
    }

    
    public void vistaCrearPersonal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        request.getRequestDispatcher("/templates/backend/usuario/form.jsp").forward(request, response);
        
    }
    
    public Usuario obtenerVistaEditarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String Id = request.getParameter("id");
        
        // Lista de usuarios a retornar
        Usuario getUsuario = control.getUsuario(Integer.valueOf(Id));
        
        request.setAttribute("usuario", getUsuario);
        
        request.getRequestDispatcher("/templates/backend/usuario/form.jsp").forward(request, response);
        
        return null;
        
    }
    
    
    private Usuario editarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Id = request.getParameter("id");
        
        // Obtenemos los valores del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        String rol = request.getParameter("rol");
        Integer estado = 1;
        
        // Creamos el objeto a guardar
        Usuario usu = new Usuario();
        
        usu.setId(Integer.valueOf(Id));
        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCorreo(correo);
        usu.setContraseña(pass);
        usu.setRol(rol);
        usu.setEstado(estado);

        // seteo y listo
        control.EditarUsuario(usu);
        
        // Lista de usuarios a retornar
        Usuario getUsuario = control.getUsuario(Integer.valueOf(Id));
        
        request.setAttribute("usuario", getUsuario);
        
        request.getRequestDispatcher("/templates/backend/usuario/form.jsp").forward(request, response);
        
        return null;
        
    }
    
            
    private List<Usuario> EliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        
        String Id = request.getParameter("id");
        
        control.EliminarUsuario(Integer.valueOf(Id));
        
        List<Usuario> listaUsuarios = control.ListarUsuario();
        
        request.setAttribute("usuarios", listaUsuarios);
        
        // Lógica para crear una nueva cita
        request.getRequestDispatcher("/templates/backend/usuario/list.jsp").forward(request, response);
        
        return null;
        
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
