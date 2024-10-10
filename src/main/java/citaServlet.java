
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.Citas;
import logica.Controladora;


@WebServlet(urlPatterns = {"/citaServlet"})
public class citaServlet extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        processRequest(request, response);
        String action = request.getParameter("dir");
        
        System.out.println("Accion => " + action);
        
        if (null == action) {
            
            // Acción por defecto si no se reconoce el parámetro
            listarCitas(request, response);
            
        } else switch (action) {
            
            case "list":
                
                System.out.println("Listando Citas.. ");
                
                // Código para crear una nueva cita
                listarCitas(request, response);
                
            break;
                
            case "info":
                
                // Código para crear una nueva cita
                infoCitas(request, response);
                
            break;
            
            case "edit":
                
                System.out.println("Editando Cita.. ");
                
                request.setAttribute("id", request.getParameter("id"));
                
                // Código para mostrar el formulario de editar cita
                obtenerVistaEditarCitas(request, response);
  
            break;
            
            case "delete":
                
                System.out.println("Eliminando Cita.. ");

                request.setAttribute("id", request.getParameter("id"));
                
                EliminarCita(request, response);
                
            break;
                
            default:
                
                // Acción por defecto si no se reconoce el parámetro
                listarCitas(request, response);
                
            break;
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        processRequest(request, response);
        
        String action = request.getParameter("dir");
        
        System.out.println("Accion => " + action);
        
        if ("create".equals(action)) {
            
            // Código para crear las citas
            crearCita(request, response);
            
        } else if ("edit".equals(action)) {
            
            // Codigo para guardar la cita
            System.out.println("Editando por post ");
            
            EditarCita(request, response);
        }
            
        
    }
    
    private List<Citas> listarCitas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Lista de usuarios a retornar
        List<Citas> listaCitas = control.ListarCita();
        
        request.setAttribute("citas", listaCitas);
        
        // Lógica para obtener la lista de citas y enviarlas a la vista
        request.getRequestDispatcher("/templates/backend/citas/list.jsp").forward(request, response);
        
        return null;
        
    }

    private Citas obtenerVistaEditarCitas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Id = request.getParameter("id");
        
        // Lista de usuarios a retornar
        Citas getCita = control.getCita(Integer.valueOf(Id));
        
        request.setAttribute("cita", getCita);
        
        // Lógica para editar una cita específica
        request.getRequestDispatcher("/templates/backend/citas/form.jsp").forward(request, response);
        
        return null;
        
    }

    private List<Citas> crearCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String cedula = request.getParameter("cedula");
        String notas = request.getParameter("notas");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String sede = request.getParameter("sede");
        Integer estado = 1;
        
        // Formatear la fecha
        LocalDateTime fechaInicio = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String creacion = fechaInicio.format(formatter);
        
        // Creamos el objeto a guardar
        Citas cita = new Citas();
        
        cita.setNombreCompleto(nombreCompleto);
        cita.setCorreo(correo);
        cita.setTelefono(telefono);
        cita.setCedula(cedula);
        cita.setNotas(notas);
        cita.setFecha(fecha);
        cita.setHora(hora);
        cita.setEstado(estado);
        cita.setCreacion(creacion);
        cita.setSede(sede);
        
        control.CrearCita(cita);
        
        List<Citas> listaCitas = control.ListarCita();
        
        request.setAttribute("citas", listaCitas);
        
        // Lógica para crear una nueva cita
        request.getRequestDispatcher("/templates/backend/citas/list.jsp").forward(request, response);
        
        return null;
        
    }
    
    private List<Citas> EditarCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Id = request.getParameter("id");
        
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String cedula = request.getParameter("cedula");
        String notas = request.getParameter("notas");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String sede = request.getParameter("sede");
        Integer estado = 1;
        
        LocalDateTime fechaInicio = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String creacion = fechaInicio.format(formatter);
        
        Citas cita = new Citas();
        
        cita.setId(Integer.valueOf(Id));
        cita.setNombreCompleto(nombreCompleto);
        cita.setCorreo(correo);
        cita.setTelefono(telefono);
        cita.setCedula(cedula);
        cita.setNotas(notas);
        cita.setFecha(fecha);
        cita.setHora(hora);
        cita.setEstado(estado);
        cita.setCreacion(creacion);
        cita.setSede(sede);
        
        // editamos la cita
        control.EditarCita(cita);
        
        // Obtenemos el objeto de la cita recien editada
        Citas getCita = control.getCita(Integer.valueOf(Id));
        
        request.setAttribute("cita", getCita);
        
        // Lógica para crear una nueva cita
        request.getRequestDispatcher("/templates/backend/citas/form.jsp").forward(request, response);
        
        return null;
        
    }
        
    private List<Citas> EliminarCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        
        String Id = request.getParameter("id");
        
        control.EliminarCita(Integer.valueOf(Id));
        
        List<Citas> listaCitas = control.ListarCita();
        
        request.setAttribute("citas", listaCitas);
        
        // Lógica para crear una nueva cita
        request.getRequestDispatcher("/templates/backend/citas/list.jsp").forward(request, response);
        
        return null;
        
    }
    
    public void infoCitas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Lógica para crear una nueva cita
        request.getRequestDispatcher("/templates/backend/citas/info.jsp").forward(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

 