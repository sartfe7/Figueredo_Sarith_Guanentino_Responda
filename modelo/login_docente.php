<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Docente</title>
    <link rel="stylesheet" href="../style.css"> <!-- Ajusta si el style.css está en otra carpeta -->
</head>
<body>
    <div class="login-container">
        <h1>🔑 Iniciar Sesión</h1>
        <h3>Perfil: Docente</h3>

        <form action="loguearse_docente.php" method="POST" class="login-form">
            <label for="email">📧 Correo electrónico:</label>
            <input type="email" name="email" id="email" required>

            <label for="password">🔒 Contraseña:</label>
            <input type="password" name="contraseña" id="password" required>

            <button type="submit" class="btn login-btn">Ingresar</button>
        </form>
    </div>
</body>
</html>

