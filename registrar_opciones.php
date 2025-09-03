<link rel="stylesheet" href="style.css">
<?php
// filepath: c:\xampp\htdocs\guanentino_responda\crear_opciones.php
$id_pregunta = isset($_GET['id_pregunta']) ? intval($_GET['id_pregunta']) : 0;
if ($id_pregunta <= 0) {
    die("ID de pregunta no válido.");
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Opciones de Respuesta</title>
    <script>
        function agregarOpcion() {
            var total = document.querySelectorAll('.opcion').length;
            if (total < 8) {
                var div = document.createElement('div');
                div.className = 'opcion';
                div.innerHTML = `
                    <hr>
                    <label>Texto de la opción:</label>
                    <input type="text" name="texto[]" required>
                    <br>
                    <label>Justificación:</label>
                    <input type="text" name="justificacion[]" required>
                    <br>
                    <label>¿Es correcta?</label>
                    <input type="checkbox" name="es_correcta[\${total}]" value="1">
                    <br>
                    <label>Imagen (opcional):</label>
                    <input type="url" name="imagen[]">
                    <br>
                `;
                document.getElementById('opciones').appendChild(div);
            }
        }
    </script>
</head>
<body>
    <h2>Registrar opciones de respuesta</h2>
    <form action="modelo/subir_opciones.php" method="POST">
        <input type="hidden" name="id_pregunta" value="<?php echo htmlspecialchars($id_pregunta); ?>">
        <div id="opciones">
            <?php for ($i = 0; $i < 3; $i++): ?>
            <div class="opcion">
                <hr>
                <label>Texto de la opción:</label>
                <input type="text" name="texto[]" required>
                <br>
                <label>Justificación:</label>
                <input type="text" name="justificacion[]" required>
                <br>
                <label>¿Es correcta?</label>
                <input type="checkbox" name="es_correcta[<?php echo $i; ?>]" value="1">
                <br>
                <label>Imagen (opcional):</label>
                <input type="url" name="imagen[]">
                <br>
            </div>
            <?php endfor; ?>
        </div>
        <button type="button" onclick="agregarOpcion()">Agregar opción</button>
        <br><br>
        <button type="submit">Guardar opciones</button>
    </form>
</body>
</html>