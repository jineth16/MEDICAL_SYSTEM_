<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="es">
    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Medical System</title>
        <link rel="icon" href="${pageContext.request.contextPath}/public/images/logo.png" type="image/x-icon">

        <!-- CDN Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>

        <!-- CDN Bootstrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>

        <!-- Link Styles CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css">
        
        <style>
            :root {

                --color-black: black;
                --color-white: white;

                /* UTIL COLORS */
                --color-background: #FFFFFF;
                --color-text: #333333;
                --color-border: #ececec;

                --color-primary: #00A79F; 

                /* STATUS COLORS */
                --color-success: #4CAF50;
                --color-error: #fb6156;
                --color-warning: #ffd24b;

            }
            
            body {
                background-image: url('../../public/images/lab_1.png');
                background-color: var(--secondary);
                margin: 0;
                padding: 0;
                font-family: 'Work Sans', sans-serif;
            }


            .navbar {
                background-color: var(--color-background);
                color: var(--color-black);
                display: flex;
                width: 100%;
                height: 80px;
                text-align: center;
            }

            .nav-link {

                list-style: none;
                display: flex;
                width: 100% !important;
            }


            .nav-link > li {
                margin-right: 1.5em;
                margin-top: 0.7em;
            }

            .nav-link .active {
                border-bottom: 2px solid var(--color-primary);
             }

            .nav-link li > a {
                color: var(--color-black);
                text-decoration: none;
            }

            .nav-link li > a:hover {
                color: var(--color-primary);
                text-decoration: none;
                border-radius: 10px;
            }

            .logo {
                color: white;
            }

            .bg-body {
                background-image: url(../../public/images/lab_1.png);
                background-size: cover;
            }

            .list-group {
                list-style: none;
                padding: 0;
                margin: 0;
                margin-left: 1em;
                margin-top: 2em;
            }

            .header-div button {
                height: 4em;
                font-size: 17px;
                font-weight: bolder;
            }
            
            a:hover {
                color: var(--color-primary);
                text-decoration: none;
            }

            .services-div-cards {
                display: flex;
                width: 100%;
                gap: 2%;
                height: 500px;
                justify-content: center;
                align-items: center;
            }

            .services-div-cards > div {
                width: 21%;
                border-right: 1px solid rgb(200, 200, 200);
                border-bottom: 1px solid rgb(200, 200, 200);
                box-shadow: rgba(0, 0, 0, 0.1) 0 5px 5px 5px;
                background-color: #dadada;
                border-radius: 10px;
                height: 350px;
                margin: 0;
                align-content: center;
                text-align: center;

            }

            .services-div-cards > div > i {
                color: var(--color-primary);
            }

            .services-div-cards > div > i:hover {
                color: var(--color-white) !important;
             }

            .services-div-cards > div:hover {
                background-color: var(--color-border);

            }

            .services-div-container {
                width: 90%;
                border-right: 1px solid rgb(200, 200, 200);
                border-bottom: 1px solid rgb(200, 200, 200);
                box-shadow: rgba(0, 0, 0, 0.1) 0 5px 5px 5px;
                border-radius: 10px;
                background-color: var(--color-white);
                margin-top: 1em;
            }

            .about_us_container {
                display: flex;
                gap: 1%;
                justify-content: center;
                align-items: center;
            }

            .about_us_container div {
                width: 40%;
                border-right: 1px solid rgb(200, 200, 200);
                border-bottom: 1px solid rgb(200, 200, 200);
                box-shadow: rgba(0, 0, 0, 0.1) 0 5px 5px 5px;
                border-radius: 10px;
                margin-top: 3em;
                background-color: var(--color-white);
            }

            .contact-us-div {
                display: flex;
                justify-content: center;
            }

            .map-div {
                justify-content: center;
                align-items: center;
            }

            .agreements {
                display: flex;
                width: 100%;
                gap: 2%;
                justify-content: center;
                align-items: center;
            }

            .agreements-cards {
                height: 300px;
                border-radius: 10px;
                box-shadow: rgba(0.1, 0, 0.1, 0.1) 5px 5px 5px 5px;
                background-color: white;
            }

            .agreements-cards-header {
                padding: 2em;
                width: 100%;
                justify-content: center;
                align-items: center;
            }

            .agreements-cards-header img {
                display: block;
                margin: 0 auto;
            }

            .agreements-cards-footer {
                width: 100%;
                background-color: #00A79F;
                color: var(--color-white);
                text-align: center;
                border-radius: 5px;
                padding: 0.5em;
            }

            .footer-social i {
                margin-top: 1em;
                margin-right: 0.5em;
            }

            .footer-social i:hover {
                color: #dadada;
            }

            .btn-primary {
                color: var(--color-white) !important;
                background-color: var(--color-primary) !important;
                border: 3px solid #18beb0 !important;
                padding: 8px;
                border-radius: 7px;
                text-decoration: none;
            }

            .btn-primary:hover {
                background-color: #18beb0 !important;
            }

            .color-primary {
                color: var(--color-primary);
            }

            .color-white {
                color: var(--color-white);
            }

            .color-grey {
                color: #818181;
            }

            .about-us-div {
                gap: 10px;
                justify-content: center;
            }

            .why-us-div, .contact-form {
                width: 49%;
                border-right: 1px solid rgb(200, 200, 200);
                border-bottom: 1px solid rgb(200, 200, 200);
                box-shadow: rgba(0, 0, 0, 0.1) 0 5px 5px 5px;
                border-radius: 10px;
                background-color: white;
            }

            .footer {
                background-color: var(--color-text);
                color: var(--color-background);
                height: 150px;
                width: 100%;
                display: flex;
                bottom: 0;
                left: 0;
            }


            /* Styles for mobile devices */
            @media (max-width: 600px) {

                body {
                    font-size: 14px; /* Smaller font size for mobile */
                }

                .button {
                    width: 100%; /* Full width buttons on mobile */
                }

            }

            /* Styles for tablets */
            @media (min-width: 601px) and (max-width: 1024px) {

                body {
                    font-size: 16px; /* Slightly larger font size for tablets */
                }

            }

            /* Styles for desktops and laptops */
            @media (min-width: 1025px) {

                body {
                    font-size: 18px;
                    max-width: 100%; /* Larger font size for desktops */
                }


                .button {
                    padding: 10px 20px; /* Larger button padding on desktops */
                }
            }
            
        </style>

    </head>
    
    <body class="bg-body">
        
        <!-- barra de navegacion -->
        <div class="col-lg-12 col-md-12 col-sm-12 navbar">
            
            <div class="col-lg-2 col-md-2 col-sm-12">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/public/images/logo.png" class="logo" width="50px" height="50px">
                </a>
            </div>
                
            <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                <ul class="nav-link col-12 mt-1">
                    <li>
                        <a href="${pageContext.request.contextPath}/templates/frontend/nosotros.jsp">
                            <i class="fa fa-users color-primary"></i>&nbsp;
                            <b>Nosotros</b>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/templates/frontend/servicios.jsp">
                            <i class="fa fa-th color-primary"></i>&nbsp;
                            <b>Servicios</b>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/templates/frontend/convenios.jsp">
                            <i class="fa fa-handshake color-primary"></i>&nbsp;
                            <b>Convenios</b>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/templates/frontend/login.jsp">
                            <i class="fa fa-cloud color-primary"></i>&nbsp;
                            <b>Descargar resultados</b>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-12 text-right">
                <a href="${pageContext.request.contextPath}/templates/frontend/registro.jsp" class="btn btn-warning col-4 fw-bolder text-center">
                    <i class="fa fa-user"></i>&nbsp;&nbsp;Registrar
                </a>
            </div>
                    
        </div>

        <!-- Contenido principal -->
        <div class="container">
            
            <form class="my-form" action="${pageContext.request.contextPath}/loginServlet" method="POST">
                
                <h1 class="text-center fw-bolder color-primary">INICIAR SESION</h1>
                    
                <div class="input__wrapper mt-3">
                    <input type="text" id="email" name="email" class="input__field" required>
                    <label for="username" class="input__label">
                        <i class="fa fa-envelope color-primary"></i>&nbsp;
                        <b>Correo</b>
                    </label>
                </div>
                
                <br>

                <div class="input__wrapper">
                    <input type="password" id="password" name="password" class="input__field " required>
                    <label for="password" class="input__label">
                        <i class="fa fa-lock color-primary"></i>&nbsp;
                        <b>Contraseña</b>
                    </label>
                </div>

                <button type="submit" class="my-form__button">Iniciar Sesion</button>

                <div class="my-form__actions text-center">
                    
                    <a href="${pageContext.request.contextPath}/templates/frontend/forgot_password.html">¿Olvidaste tu contraseña?</a>
                    
                    <a href="${pageContext.request.contextPath}/templates/frontend/registro.jsp">
                        <b class="color-primary">Crear cuenta</b>
                    </a>
                
                </div>
                
                 <!-- Mostrar error si hay -->
                <c:if test="${not empty param.error}">
                    
                    <div class="col-lg-12 col-md-12 col-sm-12 p-2 mt-1 mb-1">
                        <p class="text-center fw-bolder p-2 bg-grey" style="color: red;">${param.error}</p>
                    </div>
                    
                </c:if>

            </form>
                
        </div>

        <!-- Scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"
        integrity="sha512-5BfG7d2h6z7ehCm2XwMbYOAdBDPOQ2XkeHpMKaeO+h7TejW7J6zL9m77nbfJeCp0Q5JP5a6u1VGSR01aCmGFg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    </body>
    
</html>


