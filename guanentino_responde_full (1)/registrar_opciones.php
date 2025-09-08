<?php $page_title = "Registrar Opciones"; include __DIR__ . '/partials/header.php'; ?>
<div class="row justify-content-center">
  <div class="col-lg-10">
    <div class="card p-4 mb-4">
      <?php if(isset($_GET['exito'])): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    ¡Operación realizada con éxito!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<?php endif; ?>
      <link rel="stylesheet" href="style.css">
<?php
// filepath: c:\xampp\htdocs\guanentino_responda\crear_opciones.php
$id_pregunta = isset($_GET['id_pregunta']) ? intval($_GET['id_pregunta']) : 0;
if ($id_pregunta <= 0) {
    die("ID de pregunta no válido.");
}
?>




    <h2>Registrar opciones de respuesta</h2>
    <form action="modelo/subir_opciones.php" method="POST">
        <input maxlength="255" required type="hidden" name="id_pregunta" value="<?php echo htmlspecialchars($id_pregunta); ?>">
        <div id="opciones">
            <?php for ($i = 0; $i < 3; $i++): ?>
            <div class="opcion">
                <hr>
                <label>Texto de la opción:</label>
                <input maxlength="255" type="text" name="texto[]" required>
                <br>
                <label>Justificación:</label>
                <input maxlength="255" type="text" name="justificacion[]" required>
                <br>
                <label>¿Es correcta?</label>
                <input maxlength="255" required type="checkbox" name="es_correcta[<?php echo $i; ?>]" value="1">
                <br>
                <label>Imagen (opcional):</label>
                <input maxlength="255" required type="url" name="imagen[]">
                <br>
            </div>
            <?php endfor; ?>
        </div>
        <button type="button" onclick="agregarOpcion()">Agregar opción</button>
        <br><br>
        <button type="submit">Guardar opciones</button>
    </form>
    </div>
  </div>
</div>
<?php include __DIR__ . '/partials/footer.php'; ?>