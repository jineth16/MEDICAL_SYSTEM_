<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="es">

    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Medical System</title>

        <link rel="icon" href="${pageContext.request.contextPath}/public/images/logo.png" type="imagenes/x-icon">
        
        <!-- CDN Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- CDN Bootstrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" 
        integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        
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
                    
                    <li class="active">
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
                <a href="${pageContext.request.contextPath}/templates/frontend/login.jsp" class="btn btn-primary col-4 text-center fw-bolder">
                    <i class="fa fa-sign-in"></i>&nbsp;&nbsp;Ingreso
                </a>
            </div>

        </div>


        <!-- Valores -->
        <div class="col-lg-12 col-md-12 col-sm-12 about_us_container">

            <!-- VISION -->
            <div class="col-lg-6 col-md-6 col-sm-12">
                
                <center><h2 class="mt-2 mb-2 color-primary">VISION</h2></center>

                <p class="p-3">
                    Ser el software líder en la gestión de laboratorios médicos en Latinoamérica, reconocidos por nuestra capacidad de innovación, 
                    confiabilidad y compromiso con la mejora continua en los servicios de salud, brindando soluciones 
                    tecnológicas que garanticen una atención médica más accesible y eficiente para todos.
                </p>

                <center><h2 class="mt-2 mb-2 color-primary">MISION</h2></center>

                <p class="p-3">
                    Desarrollar una plataforma eficiente y segura para la gestión de laboratorios 
                    médicos que permita a pacientes, empleados y empresas acceder y administrar 
                    sus servicios de salud de manera ágil y confiable, facilitando la toma de 
                    decisiones clínicas con tecnología avanzada y orientada al usuario.
                </p>

            </div>


            <div class="col-lg-6 col-md-6 col-sm-12">
                
                <center><h2 class="mt-2 mb-2 color-primary">OBJETIVO</h2></center>

                <p class="p-3">
                    Optimizar la administración de servicios de laboratorio mediante un sistema intuitivo que permita a los usuarios gestionar citas, consultas y resultados desde cualquier dispositivo.
                    Mejorar la experiencia del paciente, ofreciendo herramientas para programar exámenes, acceder a sus resultados y gestionar sus datos de manera autónoma.
                    Facilitar la gestión empresarial, brindando a las empresas convenidas la capacidad de supervisar los exámenes y resultados de sus empleados con informes personalizados.
                    Automatizar y agilizar los procesos internos, reduciendo tiempos de espera y errores administrativos en la entrada de datos, análisis de muestras y generación de resultados.
                    Garantizar la seguridad de la información, implementando medidas de protección de datos que cumplan con los estándares internacionales de privacidad y confidencialidad en salud.
                </p>

            </div>

        </div>

        <!-- Footer -->
        <div class="col-lg-12 col-md-12 col-sm-12 mt-4 footer">
                
                
            <div class="col-lg-4 col-md-4 col-sm-12 text-center p-3">
                <h4 class="color-white mt-3">MEDICAL SYSTEM</h4>
                <label class="color-white">(111)-111-1111</label><br>
                <small> Villavicencio - Colombia </small>
            </div>

            <!-- Redes sociales -->
            <div class="col-lg-4 col-md-4 col-sm-12 text-center footer-social">

                <div class="col-lg-12 col-md-12 col-sm-12">

                    <!-- Facebook -->
                    <i class="fab fa-facebook fa-2x color-primary"></i>&nbsp;&nbsp;

                    <!-- Twitter -->
                    <i class="fab fa-twitter fa-2x color-primary"></i>&nbsp;&nbsp;

                    <!-- Instagram -->
                    <i class="fab fa-instagram fa-2x color-primary"></i>&nbsp;&nbsp;

                    <!-- LinkedIn -->
                    <i class="fab fa-linkedin fa-2x color-primary"></i>&nbsp;&nbsp;

                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 text-center p-3">
                    <label>www.medicalsystem.co</label>
                </div>
                
            </div>

            <!-- Links -->
            <div class="col-lg-4 col-md-4 col-sm-12">

                <div class="col-lg-12 col-md-12 col-sm-12 text-center p-3">
                    <label class="mt-3">LINKS</label>
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 text-center p-3">
                    <label class="color-primary">Inicio</label>&nbsp;&nbsp;
                    <label class="color-primary">Convenios</label>&nbsp;&nbsp;
                    <label class="color-primary">Servicios</label>&nbsp;&nbsp;
                    <label class="color-primary">Resultados</label>&nbsp;&nbsp;
                </div>

            </div>

        </div>

    </body>
    
</html>