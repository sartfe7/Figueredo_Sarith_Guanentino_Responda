<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <center>
        <h1 style="color:gold; font-family:arial ;">Bienvenido a ¡Guanentino, responda!</h1>
        <form action="registro.php" method="POST">
            <label>Tipo de usuario:</label>
            <select name="tipo_usuario" required>
                <option value="admin">Administrador</option>
                <option value="docente">Docente</option>
                <option value="digitador">Digitador</option>
            </select>
            <br><br>
        <label>Nombre:</label>
        <input type="text" name="nombre" required>
        <br><br>
        <label>Email:</label>
        <input type="email" name="email" required>
        <br><br>
        <label>Contraseña:</label>
        <input type="password" name="password" required>
        <br><br>
        <button type="submit">Registrarse</button>
</form>
    </center>
    
</body>
</html>