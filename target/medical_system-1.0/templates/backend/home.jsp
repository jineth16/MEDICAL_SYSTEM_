
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    
     <jsp:include page="/templates/backend/default/navbar.jsp" />
    
    <body>
        
        <section class="col-lg-12 col-md-12 col-sm-12 content-div">
            
            <div class="col-lg-12 col-md-12 col-sm-12 mb-4">

                <h2 class="mt-4 fw-bolder">
                    <i class="fa fa-dashboard color-primary"></i>&nbsp;
                    Bienvenido -
                    
                    <%  
                        String name = (String) session.getAttribute("user_full_name");
                        out.print(name); 
                    %>
                    
                </h2>
                
                <small class="text-muted fw-bold">Aqui puedes gestionar tu laboratorio</small>
                
            
            </div>
                
            <br>
                
            <!-- botones de direccion -->
            <div class="col-lg-12 col-md-12 col-sm-12 mb-4 d-flex">
                
                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <a href="${pageContext.request.contextPath}/citaServlet" class="btn btn-primary fw-bolder btn-lg col-6">
                        <i class="fa fa-list-check"></i>&nbsp;&nbsp;
                        Lista Citas
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <a href="#" class="btn btn-primary fw-bolder btn-lg col-6">
                        <i class="fa fa-user-check"></i>&nbsp;&nbsp;
                        Lista Pacientes
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                    <a href="${pageContext.request.contextPath}/UsuarioServlet" class="btn btn-primary fw-bolder btn-lg col-6">
                        <i class="fa fa-users"></i>&nbsp;&nbsp;
                        Lista Usuarios
                    </a>
                </div>
                
            </div>
            
        </section>
                
        
        
    </body>
      
</html>
