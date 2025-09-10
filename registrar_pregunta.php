<?php
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
    require 'modelo/conexion.php';
    session_start();

    if(isset($_SESSION['username'])) {
        $nombre_usuario = $_SESSION['username'];
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Pregunta</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="content-container">
    <h1 class="page-title">✏️ Registrar Nueva Pregunta</h1>

    <form action="modelo/reg_pregunta.php" method="POST" class="form-box">

      <fieldset>
        <legend>📘 Información de la Pregunta</legend>
<br>
        <label for="competencia">Competencia:</label>
        <textarea name="competencia" id="competencia" rows="3" required></textarea>
<br>
        <label for="Evidencia">Evidencia:</label>
        <textarea name="Evidencia" id="Evidencia" rows="3" required></textarea>
<br>
        <label for="Afirmacion">Afirmación:</label>
        <textarea name="Afirmacion" id="Afirmacion" rows="3" required></textarea>
<br>
        <label for="Contexto">Contexto:</label>
        <textarea name="Contexto" id="Contexto" rows="3" required></textarea>
<br>
        <label for="Evaluacion">Evaluación:</label>
        <textarea name="Evaluacion" id="Evaluacion" rows="3" required></textarea>
<br>
        <label for="Estandar">Estándar:</label>
        <textarea name="Estandar" id="Estandar" rows="3" required></textarea>
<br>
      </fieldset>
<br>
      <fieldset>

      <legend>🏫 Datos Académicos</legend>
<br>
        <label for="Nivel">Nivel:</label>
        <input type="text" name="Nivel" id="Nivel" required>
<br>
        <label for="id_grado">Grado:</label>
        <?php
          if(isset($_SESSION['username'])) {
              $query_dptos = "SELECT id_grado, nombre FROM grado ORDER BY id_grado ASC";
              $consulta_dptos = mysqli_query($conexion, $query_dptos) or trigger_error("Error MySQL: ".mysqli_error($conexion));

              echo "<select name='id_grado' id='id_grado' required>";
              echo "<option value=''>Seleccione un Grado</option>";
              while($row = mysqli_fetch_array($consulta_dptos)) {
                  echo '<option value="'.$row['id_grado'].'">'.$row['nombre'].'</option>';
              }
              echo "</select>";
          }
        ?>
<br>
        <label for="id_asignatura">Asignatura:</label>
        <?php
          if(isset($_SESSION['username'])) {
              $query_dptos = "SELECT id_asignatura, nombre FROM asignaturas ORDER BY id_asignatura ASC";
              $consulta_dptos = mysqli_query($conexion, $query_dptos) or trigger_error("Error MySQL: ".mysqli_error($conexion));

              echo "<select name='id_asignatura' id='id_asignatura' required>";
              echo "<option value=''>Seleccione una Asignatura</option>";
              while($row = mysqli_fetch_array($consulta_dptos)) {
                  echo '<option value="'.$row['id_asignatura'].'">'.$row['nombre'].'</option>';
              }
              echo "</select>";
          }
        ?>
      </fieldset>
<br>
      <fieldset>
        <legend>🖼️ Recursos</legend>
<br>
        <label for="path_pregunta">Si su pregunta tiene una imagen, suba el link aquí:</label>
        <input type="url" name="path_pregunta" id="path_pregunta">
      </fieldset>
<br>
      <?php
        if(isset($_SESSION['username'])) {
            echo '<input type="hidden" name="id_digitador" value="'.htmlspecialchars($_SESSION['username']).'">';
            echo '<p class="digitador-info">👤 Digitador: <strong>'.htmlspecialchars($_SESSION['username']).'</strong></p>';
        }
      ?>
<br>
      <button type="submit" class="btn">✅ Registrar Pregunta</button>
    </form>
  </div>
</body>
</body>
</html>

</html>
