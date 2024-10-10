<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    // Supongamos que tienes un objeto Cita en el request
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:choose>
            
            <c:when test="${not empty usuario}"> <title>Editar Usuario</title></c:when>
            <c:otherwise><title>Nuevo Usuario</title></c:otherwise>
            
        </c:choose>
    </head>
    
    <jsp:include page="/templates/backend/default/navbar.jsp" />
    
    <body>
        
        <section class="col-lg-12 col-md-12 col-sm-12 content-div">
            
            <!-- Header -->
            <section class="col-lg-12 col-md-12 col-sm-12 mb-3 d-flex">
        
                <div class="col-lg-8 col-md-8 col-sm-12 mb-4">
                    
                    <h2 class="p-2 mt-3 fw-bolder">
                        <c:choose>
                            
                            <c:when test="${not empty usuario}">
                                <i class="fa fa-edit color-primary"></i>&nbsp;
                                Editar Usuario
                            </c:when>

                            <c:otherwise>
                                <i class="fa fa-calendar-plus color-primary"></i>&nbsp;
                                Nuevo Usuario
                            </c:otherwise>

                        </c:choose>
                    </h2>

                    <small class="text-muted fw-bold">En este formulario puedes crear tu usuario</small>
                    
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-12 mb-4 text-end">

                    <br>
                    
                    <a href="${pageContext.request.contextPath}/UsuarioServlet" 
                    class="btn btn-outline-primary fw-bolder mt-3 col-4">
                        <i class="fa fa-arrow-left"></i>&nbsp;
                        Volver
                    </a>

                </div>
            
            </section>
                    
            <hr>

            <form class="form col-lg-12 col-md-12 col-sm-12 row p-2" action="${pageContext.request.contextPath}/UsuarioServlet" method="POST">   

                <input type="hidden" name="dir" value="<c:choose><c:when test="${not empty usuario}">edit</c:when><c:otherwise>create</c:otherwise></c:choose>"><!-- comment -->
                <input type="hidden" id="dir" name="module" value="user">
                
                <c:choose>
                    <c:when test="${not empty usuario}">
                        <input type="hidden" name="id" value="${usuario.id}">
                    </c:when>
                </c:choose>

                <div class="col-lg-4 col-md-4 col-sm-12 form-group">

                    <label for="username" class="input__label">
                        <b>Nombres</b>&nbsp;&nbsp;<b class="color-red">*</b>
                    </label>

                    <input type="text" id="nombre" name="nombre" class="input__field form form-control" 
                    value="<c:choose><c:when test="${not empty usuario}">${usuario.nombre}</c:when></c:choose>" required>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 form-group">

                    <label for="username" class="input__label">
                        <b>Apellidos</b>&nbsp;&nbsp;<b class="color-red">*</b>
                    </label>

                    <input type="text" id="apellido" name="apellido" class="input__field form-control"
                    value="<c:choose><c:when test="${not empty usuario}">${usuario.apellido}</c:when></c:choose>" required>


                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 form-group">

                    <label for="username" class="input__label">
                        <b>Correo electronico</b>&nbsp;&nbsp;<b class="color-red">*</b>
                    </label>

                    <input type="text" id="correo" name="correo" class="input__field form-control"
                    value="<c:choose><c:when test="${not empty usuario}">${usuario.correo}</c:when></c:choose>" required>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 form-group mt-3">

                    <label for="password" class="input__label">
                        <b>Contraseña</b>&nbsp;&nbsp;<b class="color-red">*</b>
                    </label>

                    <input type="password" id="pass" name="pass" class="input__field form-control" required>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 form-group mt-3">

                    <label for="username" class="input__label">
                        <b>Rol Usuario</b>&nbsp;&nbsp;<b class="color-red">*</b>
                    </label>

                    <select class="form-control" name="rol" id="rol">

                        <option value="1" <c:if test="${not empty usuario and usuario.rol == '1'}"> selected </c:if>>REGISTRO</option>
                        <option value="2" <c:if test="${not empty usuario and usuario.rol == '2'}"> selected </c:if>>ANALITICA</option>

                    </select>

                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 text-center mt-4 mb-4">
                    <button type="submit" class="my-form__button btn btn-primary btn-lg col-6">
                        
                        <c:choose>
                            
                            <c:when test="${not empty usuario}">
                                <i class="fa fa-edit"></i>&nbsp; Editar usuario
                            </c:when>
                                
                            <c:otherwise>
                                <i class="fa fa-plus"></i>&nbsp; Crear usuario
                            </c:otherwise>
                                
                        </c:choose>
                                
                    </button>
                </div>

            </form>
            
        </section>
        
    </body>
      
</html>