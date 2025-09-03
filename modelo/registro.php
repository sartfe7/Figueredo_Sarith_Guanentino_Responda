<link rel="stylesheet" href="style.css">

<?php
require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tipo = $_POST['tipo_usuario'];
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Determinar la tabla según el tipo de usuario
    switch ($tipo) {
        case 'admin':
            $tabla = 'admin';
            break;
        case 'docente':
            $tabla = 'docente';
            break;
        case 'digitador':
            $tabla = 'digitador';
            break;
        default:
            die("Tipo de usuario no válido.");
    }

    // Consulta preparada para insertar el usuario
    $sql = "INSERT INTO $tabla (nombre, email, contraseña) VALUES (?, ?, ?)";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("sss", $nombre, $email, $password);

    if ($stmt->execute()) {
        echo "<script>
            alert('El usuario ha sido registrado correctamente como $tipo.');
            window.location.href = 'home.php';
        </script>";
        exit();
    } else {
        echo "Error al registrar el usuario: " . $conexion->error;
    }
    $stmt->close();
    $conexion->close();
} else {
    echo "Acceso no permitido.";
}
