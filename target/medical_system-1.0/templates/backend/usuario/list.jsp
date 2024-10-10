<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Personal</title>
    </head>
    
     <jsp:include page="/templates/backend/default/navbar.jsp" />
    
    <body>
        
        <section class="col-lg-12 col-md-12 col-sm-12 content-div">
            
            <!-- Header -->
            <section class="col-lg-12 col-md-12 col-sm-12 d-flex">
            
                <div class="col-lg-8 col-md-8 col-sm-12 mb-4">

                    <h2 class="mt-4 fw-bolder">
                        <i class="fa fa-list color-primary"></i>&nbsp;
                        Lista de personal
                    </h2>

                    <small class="text-muted fw-bold">Aqui puedes gestionar el personal de tu laboratorio</small>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 mb-4 text-end">

                    <br>
                    
                    <a href="${pageContext.request.contextPath}/UsuarioServlet?dir=create" class="btn btn-success fw-bolder mt-4 col-4">
                        <i class="fa fa-plus"></i>&nbsp;
                        Crear Usuario
                    </a>

                </div>
            
            </section>
                        
            <hr>
            
            <section class="col-lg-12 col-md-12 col-sm-12">

                <table class="table table-responsive">
                    
                    <thead class="bg-thead">
                        <tr>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Apellido</th>
                            <th class="text-center">Correo</th>
                            <th class="text-center">Rol</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        
                        <c:forEach var="usuario" items="${usuarios}">
                            
                            <tr>
                                
                                <td class="text-center">${usuario.nombre}</td>
                                <td class="text-center">${usuario.apellido}</td>
                                <td class="text-center">${usuario.correo}</td>
                                <td class="text-center">
                                    ${usuario.rol}
                                </td>
                                <td class="text-center">
                                    
                                    <!-- Enlace para editar -->
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/UsuarioServlet?id=${usuario.id}&dir=edit">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    
                                    <!-- Enlace para eliminar -->
                                    <a href="${pageContext.request.contextPath}/UsuarioServlet?id=${usuario.id}&dir=delete" class="btn btn-danger">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                        
                                </td>
                                
                            </tr>
                            
                        </c:forEach>
                            
                    </tbody>
                    
                </table>   
                                
            </section>               
            
        </section>
        
    </body>
      
</html>