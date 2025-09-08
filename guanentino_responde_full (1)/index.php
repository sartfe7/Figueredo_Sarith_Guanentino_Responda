<?php $page_title = "Index"; include __DIR__ . '/partials/header.php'; ?>
<div class="row justify-content-center">
  <div class="col-lg-10">
    <div class="card p-4 mb-4">
      <?php if(isset($_GET['exito'])): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    ¡Operación realizada con éxito!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<?php endif; ?>
      <div class="container">

        <!-- Imágenes en las esquinas superiores -->
        <img src="img/esquina1.png" alt="Decoración izquierda" class="corner corner-left">
        <img src="img/esquina2.png" alt="Decoración derecha" class="corner corner-right">

        <!-- Imagen central -->
        <div class="center-image">
            <img src="img/centro.png" alt="Colegio Guanentá">
        </div>

        <!-- Botones -->
        <div class="buttons">
            <a href="generalidades_cg.php" class="btn">🌸 Generalidades del Colegio Guanentá</a>
            <a href="saber11.php" class="btn">📚 Información sobre el examen Saber</a>
            <a href="guanentino_r.php" class="btn">🎯 Estrategia Guanentino, Responda!</a>
            
            <a href="iniciar_secion.php" class="btn login-btn">🔐 Iniciar Sesión</a>
        </div>

    </div>
    </div>
  </div>
</div>
<?php include __DIR__ . '/partials/footer.php'; ?>