<?php
require "conexion.php";

// Verifica que la petición sea POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recoge los datos del formulario
    $competencia   = $_POST['competencia'];
    $evidencia     = $_POST['Evidencia'];
    $afirmacion    = $_POST['Afirmacion'];
    $contexto      = $_POST['Contexto'];
    $evaluacion    = $_POST['Evaluacion'];
    $estandar      = $_POST['Estandar'];
    $nivel         = $_POST['Nivel'];
    $id_grado      = $_POST['id_grado'];
    $id_asignatura = $_POST['id_asignatura'];
    $digitador_email = $_POST['id_digitador'];
    $id_digitador  = null;
    // El campo de la imagen puede venir vacío
    $id_imagen_pregunta = isset($_POST['path_pregunta']) && !empty($_POST['path_pregunta']) ? $_POST['path_pregunta'] : null;

    $query = "SELECT id_digitador FROM digitador WHERE email = ?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param("s", $digitador_email);
    $stmt->execute();
    $stmt->bind_result($id_digitador);
    $stmt->fetch();
    $stmt->close();

    if (!$id_digitador) {
        die("No se encontró el digitador.");
    }

    // Prepara la consulta SQL (ajusta los nombres de las columnas y la tabla según tu estructura)
    $sql = "INSERT INTO pregunta 
        (competencia, evidencia, afirmacion, contexto, evaluacion, estandar, nivel, id_grado, id_asignatura, id_digitador, id_imagen_pregunta) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conexion->prepare($sql);
    $stmt->bind_param(
        "sssssssssss",
        $competencia,
        $evidencia,
        $afirmacion,
        $contexto,
        $evaluacion,
        $estandar,
        $nivel,
        $id_grado,
        $id_asignatura,
        $id_digitador,
        $id_imagen_pregunta
    );

    if ($stmt->execute()) {
        echo "<script>
            alert('¡Pregunta registrada correctamente!');
            window.location.href = 'home.php';
        </script>";
        exit();
    } else {
        echo "Error al registrar la pregunta: " . $conexion->error;
    }

    $stmt->close();
    $conexion->close();
} else {
    echo "Acceso no permitido.";
}
?>