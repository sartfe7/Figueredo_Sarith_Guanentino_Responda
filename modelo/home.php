<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Guanentino Responde</title>
    
    <!-- 🔗 Conexión al archivo de estilos -->
    <link rel="stylesheet" href="../style.css">


    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Contenedor principal -->
    <div class="content-container">
        
        <!-- Header con título principal -->
        <header>
            <h1>¡Guanentino, Responde!</h1>
            <h3>Registro de Nuevo Usuario</h3>
        </header>

        <!-- Formulario de registro -->
        <div class="form-box">
            <form action="registro.php" method="POST">
                <fieldset>
                    <legend><i class="fas fa-user-plus"></i> Información del Usuario</legend>
                    
                    <!-- Tipo de usuario -->
                    <div class="form-group">
                        <label for="tipo_usuario">
                            <i class="fas fa-users"></i> Tipo de Usuario:
                        </label>
                        <select name="tipo_usuario" id="tipo_usuario" required>
                            <option value="">Seleccione un tipo de usuario</option>
                            <option value="admin">Administrador</option>
                            <option value="docente">Docente</option>
                            <option value="digitador">Digitador</option>
                        </select>
                    </div>

                    <!-- Nombre -->
                    <div class="form-group">
                        <label for="nombre">
                            <i class="fas fa-user"></i> Nombre Completo:
                        </label>
                        <input type="text" name="nombre" id="nombre" required 
                               placeholder="Ingrese su nombre completo">
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">
                            <i class="fas fa-envelope"></i> Correo Electrónico:
                        </label>
                        <input type="email" name="email" id="email" required 
                               placeholder="ejemplo@correo.com">
                    </div>

                    <!-- Contraseña -->
                    <div class="form-group">
                        <label for="password">
                            <i class="fas fa-lock"></i> Contraseña:
                        </label>
                        <input type="password" name="password" id="password" required 
                               placeholder="Ingrese una contraseña segura">
                    </div>

                    <!-- Botón de registro -->
                    <div style="text-align: center; margin-top: 2rem;">
                        <button type="submit" class="register-btn">
                            <i class="fas fa-user-plus"></i> Registrarse
                        </button>
                    </div>

                </fieldset>
            </form>

            <!-- Enlaces adicionales -->
            <div class="additional-links">
                <p>¿Ya tienes una cuenta? 
                    <!-- 🔗 Redirección fuera de modelo -->
                    <a href="../iniciar_secion.php">
                        <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                    </a>
                </p>
                <p>
                    <a href="../index.php">
                        <i class="fas fa-home"></i> Volver al Inicio
                    </a>
                </p>
            </div>
        </div>

        <!-- Información adicional -->
        <div class="info-cards">
            <div class="info-card">
                <div class="icon-wrapper">
                    <i class="fas fa-user-shield"></i>
                </div>
                <h4>Administrador</h4>
                <p>Gestión completa del sistema, usuarios y configuraciones.</p>
            </div>

            <div class="info-card">
                <div class="icon-wrapper">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <h4>Docente</h4>
                <p>Creación y gestión de preguntas y evaluaciones.</p>
            </div>

            <div class="info-card">
                <div class="icon-wrapper">
                    <i class="fas fa-keyboard"></i>
                </div>
                <h4>Digitador</h4>
                <p>Registro y captura de información académica.</p>
            </div>
        </div>

    </div>

    <script>
        // Validación del formulario
        document.querySelector('form').addEventListener('submit', function(e) {
            const tipoUsuario = document.getElementById('tipo_usuario').value;
            const nombre = document.getElementById('nombre').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value;

            // Validaciones básicas
            if (!tipoUsuario) {
                alert('Por favor seleccione un tipo de usuario');
                e.preventDefault();
                return;
            }

            if (nombre.length < 3) {
                alert('El nombre debe tener al menos 3 caracteres');
                e.preventDefault();
                return;
            }

            if (password.length < 6) {
                alert('La contraseña debe tener al menos 6 caracteres');
                e.preventDefault();
                return;
            }

            // Agregar efecto de carga al botón
            const btn = document.querySelector('.register-btn');
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Registrando...';
            btn.disabled = true;
        });

        // Efectos visuales mejorados (solo afecta a form-group)
        document.querySelectorAll('.form-group input, .form-group select').forEach(input => {
            input.addEventListener('focus', function() {
                this.closest('.form-group').style.transform = 'scale(1.02)';
            });

            input.addEventListener('blur', function() {
                this.closest('.form-group').style.transform = 'scale(1)';
            });
        });
    </script>

</body>
</html>
