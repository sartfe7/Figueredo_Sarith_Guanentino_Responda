<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
</head>
<body>
    <center>
        <h1>Iniciar sesión para administradores</h1>
        <form action="loguearse_admin.php" method="POST">
            <label for="">Ingrese su correo electrónico:</label>
            <br><br>
            <input type="text" name="email" id="" required>
            <br><br>
            <label for="">Ingrese su contraseña:</label>
            <br><br>
            <input type="text" name="contraseña" id="" required>
            <br><br>
            <button type="submit">Ingresar</button>
        </form>
    </center>
</body>
</html>