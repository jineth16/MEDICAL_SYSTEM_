<%@page import="logica.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%  
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    // Supongamos que tienes un objeto Cita en el request
    Citas cita = (Citas) request.getAttribute("cita");
%>

<!DOCTYPE html>
<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <c:choose>
            
            <c:when test="${not empty cita}"> <title>Editar Cita</title></c:when>
            <c:otherwise><title>Nueva Cita</title></c:otherwise>
            
        </c:choose>
        
    </head>
    
    <jsp:include page="/templates/backend/default/navbar.jsp" />
    
    <body>
        
       <section class="col-lg-12 col-md-12 col-sm-12 content-div">
            
            <!-- Header -->
            <section class="col-lg-12 col-md-12 col-sm-12 d-flex">
            
                <div class="col-lg-8 col-md-8 col-sm-12 mb-4">

                    <h2 class="mt-4 fw-bolder">
                        
                        <c:choose>
                            
                            <c:when test="${not empty cita}">
                                <i class="fa fa-edit color-primary"></i>&nbsp;
                                Editar Cita
                            </c:when>
                                
                            <c:otherwise>
                                <i class="fa fa-calendar-plus color-primary"></i>&nbsp;
                                Nueva Cita
                            </c:otherwise>
                                
                        </c:choose>
                                
                    </h2>

                    <small class="text-muted fw-bold">En este formulario puedes crear tu cita</small>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 mb-4 text-end">

                    <br>
                    
                    <a href="${pageContext.request.contextPath}/citaServlet" 
                    class="btn btn-outline-primary fw-bolder mt-3 col-4">
                        <i class="fa fa-arrow-left"></i>&nbsp;
                        Volver
                    </a>

                </div>
            
            </section>
                    
            <hr>
            
            <form class="form mt-4 mb-4 col-lg-12 col-md-12 col-sm-12 row" action="${pageContext.request.contextPath}/citaServlet" method="POST">
                        
                
                <input type="hidden" name="dir" value="<c:choose><c:when test="${not empty cita}">edit</c:when><c:otherwise>create</c:otherwise></c:choose>">
                
                <c:choose>
                    <c:when test="${not empty cita}">
                        <input type="hidden" name="id" value="${cita.id}">
                    </c:when>
                </c:choose>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-2">
                    <label class="fw-bolder">Nombres paciente</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="text" class="form-control" name="nombreCompleto" placeholder="Ingrese su nombre completo" 
                    maxlength="40" value="<c:choose><c:when test="${not empty cita}">${cita.nombreCompleto}</c:when></c:choose>" required >
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-2">
                    <label class="fw-bolder">Cedula</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="text" class="form-control" name="cedula" placeholder="Ingrese su cedula" 
                    maxlength="15" value="<c:choose><c:when test="${not empty cita}">${cita.cedula}</c:when></c:choose>" required>
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-2">
                    <label class="fw-bolder">Correo Electronico</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="text" class="form-control" name="correo" placeholder="Ingrese su correo"
                    maxlength="50" value="<c:choose><c:when test="${not empty cita}">${cita.correo}</c:when></c:choose>" required>
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-2">
                    <label class="fw-bolder">Telefono</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="text" class="form-control" name="telefono" placeholder="Ingrese su telefono"
                    maxlength="15" value="<c:choose><c:when test="${not empty cita}">${cita.telefono}</c:when></c:choose>" required>
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-3">
                    <label class="fw-bolder">Fecha Cita</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="date" class="form-control" name="fecha"
                    value="<c:choose><c:when test="${not empty cita}">${cita.fecha}</c:when></c:choose>" required>
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-3">
                    <label class="fw-bolder">Hora Cita</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    <input type="time" class="form-control" name="hora"  
                    value="<c:choose><c:when test="${not empty cita}">${cita.hora}</c:when></c:choose>" required>
                </div>
                
                <div class="form-group col-lg-3 col-md-4 col-sm-12 mt-3">
                    <label class="fw-bolder">Sede</label>&nbsp;&nbsp;
                    <b class="color-red">*</b>
                    
                    <select class="form-control" name="sede" id="sede">
                            
                        <option value="1" <c:if test="${not empty cita and cita.sede == '1'}"> selected </c:if>>SEDE ESPERANZA</option>
                        <option value="2" <c:if test="${not empty cita and cita.sede == '2'}"> selected </c:if>>SEDE RECREO</option>
                        <option value="3" <c:if test="${not empty cita and cita.sede == '3'}"> selected </c:if>>SEDE PORFIA</option>
                        
                    </select>
                </div>
                
                <div class="col-lg-12 col-md-12 col-sm-12 mb-2 mt-3">
                    <label class="fw-bolder">Notas</label>
                    <textarea class="form-control" name="notas" rows="4"><c:choose><c:when test="${not empty cita}">${cita.notas}</c:when></c:choose></textarea>
                </div>
                
                <div class="col-lg-12 col-md-12 col-sm-12 text-center mb-4 mt-3">

                    <br>
                    <button type="submit" class="btn btn-success fw-bolder mt-4 col-4">

                        <c:choose>
                            
                            <c:when test="${not empty cita}">
                                <i class="fa fa-edit"></i>&nbsp; Editar Cita
                            </c:when>
                                
                            <c:otherwise>
                                <i class="fa fa-plus"></i>&nbsp; Crear Cita
                            </c:otherwise>
                                
                        </c:choose>
                                
                    </button>
                    
                </div>

            </form>
            
        </section>
        
    </body>
      
</html>