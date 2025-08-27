<?php
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
?>

<?php
    require 'modelo/conexion.php';

    session_start();

    if(isset($_SESSION['username']))
    {
        $nombre_usuario = $_SESSION['username'];
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Pregunta</title>
</head>
<body>
    <h1>Registra tu Pregunta</h1>
    <br><br>
    <form action="modelo/reg_pregunta.php" method="POST">
        <label for="">Competencia: </label>
        <input type="textarea" name="competencia" id="" cols="30" rows="20" required>
        <br><br>
        <label for="">Evidencia: </label>
        <textarea name="Evidencia" id="" cols="30" rows="5" required></textarea>
        <br><br>   
        <label for="">Afirmación: </label>
        <textarea name="Afirmacion" id="" cols="30" rows="5" required></textarea>
        <br><br>
        <label for="">Contexto: </label>
        <textarea name="Contexto" id="" cols="30" rows="5" required></textarea>
        <br><br>
        <label for="">Evaluación: </label>
        <textarea name="Evaluacion" id="" cols="30" rows="5" required></textarea>
        <br><br>
        <label for="">Estandar: </label>
        <textarea name="Estandar" id="" cols="30" rows="5" required></textarea>
        <br><br>
        <label for="">Nivel: </label>
        <input type="text" name="Nivel" id="" required>
        <br><br>
        <label for="">Grado: </label>
        <!--Mostrar listado de departamos registrados-->
        
        <?php
        
            if(isset($_SESSION['username']))
            {
                // consultar departamentos registrados y ponerlos en una lista tipo select
                $query_dptos = "SELECT id_grado, nombre FROM grado ORDER BY id_grado ASC";

                $consulta_dptos = mysqli_query($conexion, $query_dptos) or trigger_error("Error en la consulta MySQL: ".mysqli_error($conexion));

                echo "<select name = 'id_grado' required/>";
                echo "<option value = '0'>Selecione un Grado</option>";
                while($row = mysqli_fetch_array($consulta_dptos))
                {
                    echo '<option value = "'.$row['id_grado'].'">'.$row['nombre'].'</option>';
                }
                echo "</select>";
            }
            
        ?>
        <br><br>
        <label for="">Asignatura: </label>
        <!--Mostrar listado de departamos registrados-->
        
        <?php
        
            if(isset($_SESSION['username']))
            {
                // consultar departamentos registrados y ponerlos en una lista tipo select
                $query_dptos = "SELECT id_asignatura, nombre FROM asignaturas ORDER BY id_asignatura ASC";

                $consulta_dptos = mysqli_query($conexion, $query_dptos) or trigger_error("Error en la consulta MySQL: ".mysqli_error($conexion));

                echo "<select name = 'id_asignatura' required/>";
                echo "<option value = '0'>Selecione una asignatura</option>";
                while($row = mysqli_fetch_array($consulta_dptos))
                {
                    echo '<option value = "'.$row['id_asignatura'].'">'.$row['nombre'].'</option>';
                }
                echo "</select>";
            }
            
        ?>
        <br><br>
        <label for="">Si su pregunta tiene una imagen, suba el link aquí: </label>
        <input type="url" name="path_pregunta" id="" >
        <br><br>
        <?php
    // ...código existente...
        if(isset($_SESSION['username'])) {
            echo '<input type="hidden" name="id_digitador" value="'.htmlspecialchars($_SESSION['username']).'">';
            echo '<p>Digitador: <strong>'.htmlspecialchars($_SESSION['username']).'</strong></p>';
        }
    ?>
        <button type="submit">Registrar</button>
    </form>
</body>
</html>