<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Medical System</title>
        <link rel="icon" href="${pageContext.request.contextPath}/imagenes/logo.png" type="imagenes/x-icon">

        <!-- CDN Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- CDN Bootstrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
              integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Link Styles CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">

        <!-- Inline Styles -->
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
            
            .color-primary {
                color: var(--primary);
            }

            .bg-body {
                background-image: url(../../public/images/lab_1.png);
                background-size: cover;
                background-color: var(--secondary);
                margin: 0;
                padding: 0;
                font-family: 'Work Sans', sans-serif;
            }

            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1rem;
                background-color: var(--white);
                color: var(--text);
                padding-left: calc(3rem - 1rem);
            }

            .navbar .logo {
                height: 3rem;
            }

            .navbar ul.nav-link {
                list-style: none;
                padding: 0;
                margin-left: -1rem;
                display: flex;
                 gap: 1.0rem;
                 transition: all 0.2s ease-in-out;

            }

            .navbar ul.nav-link li {
                margin: 0;
                margin-left: 1rem

            }

            /* Comentario en español:
               Cambios realizados para la barra de navegación:
               1. El color del texto de los enlaces es negro.
               2. El texto de los enlaces está en negrita. */
            .navbar ul.nav-link li a {
                color: var(--text); /* Color de texto en negro */
                text-decoration: none;
                font-weight: bold; /* Texto en negrita */
            }

            .navbar ul.nav-link li a:hover {
                color: var(--primary-light);
            }

            /* Comentario en español:
               Cambios realizados para el botón de iniciar sesión:
               1. El color de fondo del botón es #00A79F.
               2. El color del texto del botón es blanco. */
            .btn-primary {
                background-color: #00A79F; /* Color de fondo del botón */
                color: var(--white); /* Color del texto del botón */
                border: none;
                font-weight: bold;
            }

            .btn-primary:hover {
                background-color: #059089; /* Color de fondo del botón al pasar el ratón */
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 4rem); /* Ajustar la altura para tener en cuenta la barra de navegación */
                padding: 2rem;
            }

            .my-form {
                display: flex;
                flex-direction: column;
                justify-content: start;
                gap: 1rem;
                background-color: var(--white);
                width: 100%;
                max-width: 32rem;
                padding: 3rem 2rem;
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                font-family: 'Work Sans', sans-serif;
            }

            .my-form__button {
                background-color: var(--primary);
                color: white;
                white-space: nowrap;
                border: none;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 1rem;
                line-height: 3.125rem;
                outline: none;
                font-size: 1.125rem;
                letter-spacing: .025rem;
                text-decoration: none;
                cursor: pointer;
                font-weight: 800;
                min-height: 3.125rem;
                width: 100%;
                border-radius: 10rem;
                transition: all .3s ease;
            }

            .my-form__button:hover {
                background-color: var(--primary-dark);
            }

            .input__wrapper {
                position: relative;
                padding: 0.9375rem 0 0;
                margin-bottom: 0.5rem;
            }

            .input__field {
                font-size: 1.5rem;
                color: var(--text);
                padding: 0.375rem 0;
                padding-right: 2rem;
                padding-bottom: 0.5rem;
                line-height: 2rem;
                height: 2rem;
                outline: 0;
                border: 0;
                width: 100%;
                vertical-align: middle;
                padding-bottom: 0.7rem;
                border-bottom: 1px solid var(--secondary);
                background: transparent;
                transition: border-color 0.2s;
            }

            .input__field::placeholder {
                color: transparent;
            }

            .input__label {
                user-select: none;
            }

            .input__label,
            .input_field:focus~.input_label {
                position: absolute;
                top: -0.8rem;
                display: block;
                font-size: 1.2rem;
                color: var(--text);
                transition: 0.3s;
            }

            .input__field:focus {
                border-bottom: 2px solid darkseagreen;
            }
            
            .color-primary {
                color: var(--primary);
            }

            .input__field:focus~svg {
                stroke: var(--primary);
            }

            .input__icon {
                position: absolute;
                right: -0.875rem;
                bottom: -0.6875rem;
                width: 2.25rem;
                height: 2.25rem;
                padding: 0.125rem;
                transform: translate(-50%, -50%);
                transform-origin: center;
                cursor: pointer;
            }

            .input__icon:hover {
                border-radius: 50%;
                color: var(--primary);
            }

            .my-form__actions {
                display: flex;
                flex-direction: column;
                align-self: center;
                color: var(--primary-dark);
                gap: 1rem;
                margin-top: 0.5rem;
            }

            .my-form__actions a {
                color: var(--text);
                font-weight: 600;
                text-decoration: none;
            }

            .my-form__actions a:hover {
                text-decoration: underline;
            }

            @media (max-width: 600px) {
                body {
                    font-size: 14px; /* Tamaño de fuente más pequeño para móviles */
                    height: 100vh;
                }

                .navbar {
                    flex-direction: column;
                    align-items: center;
                }

                .my-form {
                    width: 100%;
                    max-width: 27rem;
                }
            }

            @media (min-width: 601px) and (max-width: 1024px) {
                body, footer {
                    font-size: 14px; /* Tamaño de fuente ligeramente más grande para tablets */
                }

                .my-form {
                    width: 100%;
                    max-width: 28rem;
                }
            }

            @media (min-width: 1024px) {
                body, footer {
                    font-size: 16px; /* Tamaño de fuente más grande para escritorios */
                }

                .my-form {
                    width: 100%;
                    max-width: 30rem;
                    zoom: 90%;
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
                <a href="${pageContext.request.contextPath}/templates/frontend/registro.jsp" class="btn btn-primary col-4 text-center">
                    <i class="fa fa-star"></i>&nbsp;Registrar
                </a>
            </div>
                    
        </div>

        <div class="container">
            
            <form class="form col-lg-12 col-md-12 col-sm-12 my-form" action="${pageContext.request.contextPath}/UsuarioServlet" method="POST">
                
                <input type="hidden" id="dir" name="dir" value="create">
                <input type="hidden" id="dir" name="module" value="register">
                
                <div class="col-lg-12 col-md-12 col-sm-12 mb-2 mt-2 text-center">
                    <h3 class="color-primary fw-bolder">CREAR CUENTA</h3>
                </div>
                    
                <div class="input__wrapper mt-2">
                    <input type="text" id="nombre" name="nombre" class="input__field form" required>
                    <label for="username" class="input__label">
                        <i class="fa fa-user color-primary"></i>&nbsp;&nbsp;
                        <b>Nombres</b>
                    </label>
                </div>
                    
                <div class="input__wrapper mt-2">
                    <input type="text" id="apellido" name="apellido" class="input__field" required>
                    <label for="username" class="input__label">
                        <i class="fa fa-user color-primary"></i>&nbsp;&nbsp;
                        <b>Apellidos</b>
                    </label>
                </div>
                    
                <div class="input__wrapper mt-2">
                    <input type="text" id="correo" name="correo" class="input__field" required>
                    <label for="username" class="input__label">
                        <i class="fa fa-envelope color-primary"></i>&nbsp;&nbsp;
                        <b>Correo electronico</b>
                    </label>
                </div>
                    
                <div class="input__wrapper mt-2">
                    <input type="password" id="pass" name="pass" class="input__field" required>
                    <label for="password" class="input__label">
                        <i class="fa fa-lock color-primary"></i>&nbsp;&nbsp;
                        <b>Contraseña</b>
                    </label>
                </div>
                    
                <div class="input__wrapper mt-2">
                    
                    <label for="username" class="input__label">
                        <i class="fa fa-exchange color-primary"></i>&nbsp;&nbsp;
                        <b>Rol Usuario</b>
                    </label>
                    
                    <select class="form-control mt-2" name="rol" id="rol">
                        
                        <option value="1">REGISTRO</option>
                        <option value="2">ANALITICA</option>
                        
                    </select>
                    
                </div>
                    
                <button type="submit" class="my-form__button">Crear cuenta</button>

        </form>
                
        </div>

    </body>
    
</html>
