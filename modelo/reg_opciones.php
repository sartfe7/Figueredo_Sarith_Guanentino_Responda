<link rel="stylesheet" href="style.css">

<?php
// filepath: c:\xampp\htdocs\guanentino_responda\modelo\subir_opciones.php
require "conexion.php";

$id_pregunta = intval($_POST['id_pregunta']);
$textos = $_POST['texto'];
$justificaciones = $_POST['justificacion'];
$imagenes = $_POST['imagen'];
$es_correcta = isset($_POST['es_correcta']) ? $_POST['es_correcta'] : [];

for ($i = 0; $i < count($textos); $i++) {
    $texto = $textos[$i];
    $justificacion = $justificaciones[$i];
    $imagen = !empty($imagenes[$i]) ? $imagenes[$i] : null;
    $correcta = isset($es_correcta[$i]) ? 1 : 0;

    // Si tienes una tabla de imágenes para las opciones y necesitas guardar el path y obtener el id:
    $id_imagen_ans = null;
    if ($imagen) {
        $sql_img = "INSERT INTO imagenes_ans (path_imagen) VALUES (?)";
        $stmt_img = $conexion->prepare($sql_img);
        $stmt_img->bind_param("s", $imagen);
        $stmt_img->execute();
        $id_imagen_ans = $stmt_img->insert_id;
        $stmt_img->close();
    }

    // Inserta la opción de respuesta
    $sql = "INSERT INTO opcion_respuesta (texto, justificacion, es_correcta, id_pregunta, id_imagen_ans) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("ssiii", $texto, $justificacion, $correcta, $id_pregunta, $id_imagen_ans);
    $stmt->execute();
    $stmt->close();
}

$conexion->close();

echo "<script>
    alert('Opciones registradas correctamente.');
    window.location.href = '../home_admin.php';
</script>";
exit();
?>