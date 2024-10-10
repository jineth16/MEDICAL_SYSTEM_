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
            
            .color-white {
                color: white !important;
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

            .header-div {
                background-image: url(public/images/lab_1.png);
                background-size: cover;
                background-color: var(--color-primary);
                margin-bottom: 2em;
                margin-top: 0.5em;
                width: 100%;
                height: 500px;
                text-align: center;
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
            
            .btn-success {
                color: white;
                background-color: var(--primary);
                border: 2px solid var(--color-primary);
            }
            
            .btn-success:hover {
                color: white;
                background-color: #18beb0;
                border: 3px solid var(--color-primary);
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

    <body>
        
        <!-- barra de navegacion -->
        <div class="col-lg-12 col-md-12 col-sm-12 navbar">
            
            <div class="col-lg-2 col-md-2 col-sm-12">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/public/images/logo.png" class="logo" width="50px" height="50px">
                </a>
            </div>
                
            <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                
                <ul class="nav-link col-12 mt-2">
                    
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
                <a href="${pageContext.request.contextPath}/templates/frontend/login.jsp" class="btn btn-success col-4 text-center fw-bolder">
                    <i class="fa fa-sign-in"></i>&nbsp;&nbsp;Ingreso
                </a>
            </div>
                    
        </div>

        <!-- Header Section -->
        <div class="header-div text-center">
            <br>
            <h2 class="fw-bolder color-primary mt-4 mb-4">
                Bienvenidos al Sistema Médico
            </h2>
            <br>
            <p class="fw-bolder color-white mt-4">Soluciones integrales para el sector salud.</p>
            <br>
            <button type="button" class="btn btn-success btn-lg col-3">CONOCE MAS</button>
        </div>

        <!-- Content Section -->
        <div class="container">
            
            <div class="services-div-cards">
                
                <div>
                    
                    <i class="fa fa-users fa-3x"></i><br>
                    
                    <h6>MANEJO DE PERSONAL</h6>
                    
                    <small>El software permite a los empleados del laboratorio gestionar 
                        de forma eficiente la información de pacientes, exámenes y convenios.
                    </small>
                    
                    <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
                       <a href="${pageContext.request.contextPath}/templates/frontend/servicios.jsp" class="color-primary col-4 mt-1 mb-1 text-decoration-none">Ver Más</a>
                    </div>
                    
                </div>

                <div>
                    
                    <i class="fa fa-file-alt fa-3x"></i><br>
                    
                    <h6>INFORMES</h6>
                    
                    <small>Las empresas pueden generar informes detallados 
                        en formato Excel con el historial de sus pacientes, facilitando el análisis y la gestión.
                    </small>
                  
                    <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
                        <a href="${pageContext.request.contextPath}/templates/frontend/servicios.jsp" class="color-primary text-decoration-none col-4 mt-1 mb-1"> Ver Más</a>
                    </div>
                    
                </div>
                  
                <div>
                    
                    <i class="fa fa-cloud fa-3x"></i><br>
                    
                    <h6>DESCARGA DE RESULTADOS</h6>
                    
                    <small>Los pacientes y empresas pueden acceder y descargar los 
                        resultados de los exámenes de laboratorio de manera rápida y segura.
                    </small>
                    
                    <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
                        <a href="${pageContext.request.contextPath}/templates/frontend/servicios.jsp" class="color-primary text-decoration-none col-4 mt-1 mb-1"> Ver Más</a>
                    </div>
                    
                </div>
                    
                <div>
                    
                    <i class="fa fa-hospital fa-3x"></i><br>
                    
                    <h6>VARIEDAD DE LABORATORIOS</h6>
                    
                    <small>Los usuarios pueden consultar y acceder a un amplio portafolio de servicios de 
                        laboratorio disponibles alrededor del pais
                    </small>
                    
                    <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
                        <a href="${pageContext.request.contextPath}/templates/frontend/servicios.jsp" class="color-primary text-decoration-none col-4 mt-1 mb-1"> Ver Más</a>
                    </div>
                    
                </div>
                    
            </div>
        </div>


        <!-- Seccion 3 - Contactanos -->
        <div class="col-lg-12 col-md-12 col-sm-12 about-us-div d-flex mt-4">

            <section class="col-lg-6 col-md-6 col-sm-12 why-us-div p-3">

                <div class="col-lg-12 col-md-12 col-sm-12 mt-4 text-center">

                    <h3 class="fw-bolder">¿PORQUE ELEGIRNOS A NOSOTROS?</h3>
                    <small class="color-primary">
                        <b>Ventajas de usar nuestro software Software Medical System</b>
                    </small>

                </div>

                <section class="row col-lg-12 col-md-12 col-sm-12">

                    <div class="row col-lg-12 col-md-12 col-sm-12">

                        <ul class="list-group">

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Gestión completa</b>
                                <p class="style-text-soft-hard">Acceso a resultados, programación de citas y gestión de datos de manera sencilla e intuitiva.</p>
                            </li>

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Acceso remoto</b>
                                <p class="style-text-soft-hard">Permite a usuarios y empresas acceder en tiempo real a la información desde cualquier lugar.</p>
                            </li>

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Informes detallados</b>
                                <p class="style-text-soft-hard">Ofrece informes precisos y descargables, ideales para empresas en convenio.</p>
                            </li>

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Seguridad</b>
                                <p class="style-text-soft-hard">Cumple con altos estándares de seguridad y protección de datos.</p>
                            </li>

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Adaptabilidad</b>
                                <p class="style-text-soft-hard">Se ajusta a las necesidades específicas de cada laboratorio.</p>
                            </li>

                            <li class="list-group-item">
                                <i class="fa fa-check color-primary"></i>&nbsp;
                                <b class="color-grey">Soporte técnico</b>
                                <p class="style-text-soft-hard"> Garantizamos asistencia continua para asegurar una experiencia sin interrupciones.</p>
                            </li>

                        </ul>

                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                        <a href="${pageContext.request.contextPath}/templates/frontend/nosotros.jsp" class="btn btn-primary btn-lg col-4 mt-4 mb-4">Ver Más</a>
                    </div>

                </section>

            </section>

            <!-- Contact Form -->
            <section class="col-lg-6 col-md-6 col-sm-12 contact-form p-3">

                <div class="col-lg-12 col-md-12 col-sm-12 mt-4 text-center">
                    <h3 class="fw-bolder">CONTACTANOS!</h3>
                    <small class="color-primary"><b>Es un placer porder ayudar a crecer tu laboratorio</b></small>
                </div>

                <form class="form p-2 mb-2">

                    <div class="form-group mt-4">
                        <label for="exampleInputEmail1"><b>Mensaje</b> *</label>
                        <textarea type="email" class="form-control" placeholder="deja un mensaje aqui!"></textarea>
                    </div>

                    <div class="form-group mt-4">
                        <label for="exampleInputPassword1"><b>Correo Electronico</b> *</label>
                        <input type="password" class="form-control" placeholder="Ingresa tu direccion de correo">
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 mt-4 text-center">
                        <button type="submit" class="btn btn-primary btn-lg col-6 mt-4">
                            <i class="fa fa-envelope"></i>&nbsp;
                            <b>Enviar Informacion</b>
                        </button>
                    </div>

                </form>

                <!-- Mapa -->
                <div class="col-lg-12 col-md-12 col-sm-12 mt-4 map-div">

                    <h5 class="mt-4">
                        <i class="fa fa-map color-primary"></i>&nbsp;
                        Nuestra Ubicacion
                    </h5>

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22303.972223655262!2d-73.63427191106102!3d4.118035703078535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3e2ddfba283211%3A0x537e40041d7b20c2!2sVillavicencio%2C%20Meta!5e0!3m2!1ses-419!2sco!4v1726348714743!5m2!1ses-419!2sco" 
                    width="90%" height="400" style="border-radius: 5px;border: 2px solid rgb(206, 206, 206);margin-top: 1em;margin-bottom: 2em;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>

            </section>

        </div>

        <!-- agreements -->
        <section class="col-lg-12 col-md-12 col-sm-12 mt-3">

            <div class="col-lg-12 col-md-12 col-sm-12 mt-4 mb-2 text-center">
                <h1 class="fw-bolder">CONVENIOS</h1>
                <small class="color-primary"><b>Estas plataformas y entidades usan nuestro producto</b></small>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 mt-4 mb-2 agreements row">

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_1.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>Activa EPS</b></h3>
                    </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_2.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>Sanitas Meta</b></h3>
                    </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_1.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>IPS del valle</b></h3>
                    </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_1.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>Hospital Universitario</b></h3>
                    </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_2.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>Hospital del Meta</b></h3>
                    </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 agreements-cards mt-2">

                    <!-- image -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-header">
                        <img src="${pageContext.request.contextPath}/public/images/ag_1.png" width="150px" height="150px" class="imagenes">
                    </div>

                    <!-- Company name -->
                    <div class="col-lg-12 col-md-12 col-sm-12 agreements-cards-footer">
                        <h3><b>Sura CO</b></h3>
                    </div>

                </div>

            </div>

        </section>

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

        <!-- Boostrap CDN JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" 
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    </body>
    
</html>
