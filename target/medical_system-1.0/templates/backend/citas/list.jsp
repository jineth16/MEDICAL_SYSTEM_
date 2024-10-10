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
        <title>Lista Citas</title>
    </head>
    
     <jsp:include page="/templates/backend/default/navbar.jsp" />
    
    <body>
        
        <section class="col-lg-12 col-md-12 col-sm-12 content-div">
            
            <!-- Header -->
            <section class="col-lg-12 col-md-12 col-sm-12 d-flex">

                <div class="col-lg-8 col-md-8 col-sm-12 mb-4">

                    <h2 class="mt-4 fw-bolder">
                        <i class="fa fa-list color-primary"></i>&nbsp;
                        Lista de citas
                    </h2>
                    
                    <small class="text-muted fw-bold">Aqui puedes gestionar tu laboratorio</small>

                </div>
            
                <div class="col-lg-4 col-md-4 col-sm-12 mb-4 text-end">
                    
                    <br>
                    <a href="${pageContext.request.contextPath}/templates/backend/citas/form.jsp" class="btn btn-success fw-bolder mt-4 col-4">

                        <i class="fa fa-plus"></i>&nbsp;
                        Crear Cita

                    </a>
                    
                </div>

            </section>
                    
            <hr>
                    
            <!-- Lista de citas -->
            <section class="col-lg-12 col-md-12 col-sm-12">
            

                <table class="table table-responsive">
                    
                    <thead class="bg-thead bg-dark">
                        
                        <tr>
                            <th class="text-center">Nombre Paciente</th>
                            <th class="text-center">Correo</th>
                            <th class="text-center">Telefono</th>
                            <th class="text-center">Sede</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                        <c:forEach var="citas" items="${citas}">
                            
                            <tr>
                                <td class="text-center">${citas.nombreCompleto}</td>
                                <td class="text-center">${citas.correo}</td>
                                <td class="text-center">${citas.telefono}</td>
                                <td class="text-center">
                                    ${cita.sede}
                                    <c:choose>
                                        
                                        <c:when test="${not empty cita and cita.sede == 1}">
                                            <b class="color-primary">SEDE ESPERANZA</b>
                                            ${cita.sede}
                                        </c:when>
                                    
                                        <c:when test="${not empty cita and cita.sede == 2}">
                                            <b class="color-primary">SEDE RECREO</b>
                                            ${cita.sede}
                                        </c:when>

                                        <c:when test="${not empty cita and cita.sede == 3}">
                                            <b class="color-primary">SEDE PORFIA</b>
                                            ${cita.sede}
                                        </c:when>
                                            
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    ${cita.estado}
                                    <c:choose>
                                        
                                        <c:when test="${not empty cita and cita.estado == 1}">
                                            <b class="color-primary">ASIGNADA</b>
                                        </c:when>

                                        <c:when test="${not empty cita and cita.estado == 2}">
                                            <b class="color-primary">HECHA</b>
                                        </c:when>

                                        <c:when test="${not empty cita and cita.estado == 3}">
                                            <b class="color-primary">CERRADA</b>
                                        </c:when>
                                    
                                    </c:choose>
                                </td>
                                
                                <td class="text-center">
                                    
                                    <!-- Enlace para editar -->
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/citaServlet?id=${citas.id}&dir=edit">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                        
                                    &nbsp;&nbsp;&nbsp;
                                    <!-- Enlace para eliminar -->
                                    <a href="${pageContext.request.contextPath}/citaServlet?id=${citas.id}&dir=delete" class="btn btn-danger">
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