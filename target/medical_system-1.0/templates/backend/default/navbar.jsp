
<%@page import="java.lang.String"%>
<%@ page import="logica.Usuario" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="icon" href="${pageContext.request.contextPath}/public/images/logo.png" type="imagenes/x-icon">

        <!-- CDN Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- CDN Bootstrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
        
        <style>
            :root {
                --primary: #00A79F;
                --primary-dark: #059089;
                --primary-light: #05c7bd;
                --secondary: #048983;
                --social-background: #E9E9E9;
                --social-background-hover: #dddddd;
                --text: #333333;
                --white: #FFFFFF;
                --violet: #d4d4d4;
            }

            .btn-primary {
                background-color: #00A79F; /* Color de fondo del bot�n */
                color: var(--white); /* Color del texto del bot�n */
                border: none;
                font-weight: bold;
            }

            .btn-primary:hover {
                background-color: #059089; /* Color de fondo del bot�n al pasar el rat�n */
            }

            .color-primary {
                color: var(--primary);
            }

            .color-white {
                color: var(--white);
            }
            
            .bg-thead {
                background-color: var(--primary) !important;
                color: white !important;
            }

            .color-grey {
                color: #818181;
            }
            
            .color-red {
                color: tomato;
            }
            
            .nav-link:hover {
                color: var(--primary-dark);
            }
            
            .content-div {
                width: 95%;
                height: 100%;
                margin: 0 auto;
                padding: 2em;
                border: 1px solid rgb(200, 200, 200);
                box-shadow: rgba(0.1, 0.1, 0.1, 0.1) 3px 3px 3px 3px;
                border-radius: 10px;
                margin-top: 2em;
            }

        </style>
        
    </head>
    
    
    <!-- Validacion para rebotar usuarios fuera de session -->
    <%  
        session = request.getSession(false);
        
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/templates/frontend/login.jsp");
        }
        
    %>

        
    <!-- Barra de navegacion para la app -->
    <div class="container-fluid">

        <nav class="navbar navbar-expand-lg navbar-light bg-light col-lg-12 col-md-12">

          <a class="navbar-brand col-2 fw-bolder" href="${pageContext.request.contextPath}/templates/backend/home.jsp">Medical System</a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse col-10" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto col-8" style="gap: 20px;">

              <!-- Roles: TODOS -->
              <li class="nav-item">
                  
                <a class="nav-link fw-bolder" href="${pageContext.request.contextPath}/templates/backend/home.jsp">
                    <i class="fa fa-home color-primary"></i>&nbsp;
                    Inicio <span class="sr-only">(current)</span>
                </a>

              </li>

              <!-- Roles: CEO & LABS -->
              <li class="nav-item">
                   
                <a class="nav-link fw-bolder" href="${pageContext.request.contextPath}/citaServlet">
                    <i class="fa fa-calendar-check color-primary"></i>&nbsp;
                    Citas
                </a>

              </li>

              <!-- Roles: SUPER ADMIN & CEO -->
              <li class="nav-item">
                  
                <a class="nav-link fw-bolder" href="${pageContext.request.contextPath}/pacienteServlet">
                    <i class="fa fa-hospital-user color-primary"></i>&nbsp;
                    Pacientes
                </a>

              </li>

              <!-- Roles: SUPER ADMIN & CEO & LABS -->
              <li class="nav-item">
                  
                <a class="nav-link fw-bolder" href="${pageContext.request.contextPath}/UsuarioServlet">
                    <i class="fa fa-user-check color-primary"></i>&nbsp;
                    Personal
                </a>

              </li>

            </ul>

             <!-- Cerrar Sesion -->
            <form class="form-inline my-2 my-lg-0 d-lg-flex d-sm-none col-4" method="GET" action="${pageContext.request.contextPath}/loginServlet">

                <label class="my-2 my-sm-8 col-8"><b>

                    <% 
                        String name = (String) session.getAttribute("user_full_name");
                        out.print(name);
                    %> -
                    
                    <b class="color-primary">
                        <%
                            String rol = (String) session.getAttribute("user_role");

                            if (rol != null) {

                                switch (rol) {

                                default:
                                    out.print("Anonimo");
                                break;

                                case  "1":
                                    out.print("Registro");
                                break;

                                case "2":
                                    out.print("Analitica");
                                break;

                                }

                            }
                        %>
                    </b>
                    
                    <small class="text-muted"> 
                         
                    </small>

                </b></label>

                <button class="btn btn-danger my-2 my-sm-0 col-3 float-right" type="submit">
                    <i class="fa fa-sign-out"></i>&nbsp;
                    <b> Salir </b>
                </button>

            </form>

          </div>

        </nav>

    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-5BfG7d2h6z7ehCm2XwMbYOAdBDPOQ2XkeHpMKaeO+h7TejW7J6zL9m77nbfJeCp0Q5JP5a6u1VGSR01aCmGFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</html>
