
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Controladora;
import logica.Usuario;


@WebServlet(urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    }
    
    // Aqui el GET valida log out (Salida del usuario)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        processRequest(request, response);
        
        // Manejo del logout
        HttpSession session = request.getSession(false);  // No crear una nueva sesión si no existe
        
        if (session != null) {
            session.invalidate();  // Invalidar la sesión
        }
        
        response.sendRedirect(request.getContextPath() + "/templates/frontend/login.jsp");
        
    }
    
    // Aqui el POST valida login (Entrada del usuario)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        // Obtener los parámetros del formulario
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println("Email es " + email);
        System.out.println("Password es " + password);
        
        Usuario usu = control.LoginCheck(email, password);
        
        if (usu != null) {
            
            // Credenciales válidas, crear sesión
            HttpSession session = request.getSession();

            // Formatear la fecha
            LocalDateTime fechaInicio = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String fechaFormateada = fechaInicio.format(formatter);

            session.setAttribute("user_full_name", usu.getNombre() +' '+ usu.getApellido());
            session.setAttribute("user_role", usu.getRol());
            session.setAttribute("user_session_date", fechaFormateada);

            // Redirigir a la página de inicio
            response.sendRedirect(request.getContextPath() + "/templates/backend/home.jsp");
            
        } else {
            
            // Credenciales inválidas, volver al login con mensaje de error
            response.sendRedirect("templates/frontend/login.jsp?error=Credenciales+ incorrectas");
        }
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
