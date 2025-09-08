<?php $page_title = "Home Admin"; include __DIR__ . '/partials/header.php'; ?>
<div class="row justify-content-center">
  <div class="col-lg-10">
    <div class="card p-4 mb-4">
      <?php if(isset($_GET['exito'])): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    ¡Operación realizada con éxito!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<?php endif; ?>
      <div class="content-container">
    <h1 class="page-title">🌸 Bienvenido Administrador a ¡Guanentino, Responda!</h1>

    <div class="admin-options">
      <!-- Opción 1 -->
      <div class="option-card">
        <img src="img/pregunta.png" alt="Crear Pregunta" class="option-img" width="90px" height="90px">
        <a href="registrar_pregunta.php" class="btn">✏️ Crear Pregunta</a>
      </div>
<br>
      <!-- Opción 2 -->
      <div class="option-card">
        <img src="img/usuario.png" alt="Registrar Usuario" class="option-img width= "90px" height="90px">
        <a href="modelo/home.php" class="btn">👥 Registrar Usuario</a>
      </div>
    </div>
  </div>
    </div>
  </div>
</div>
<?php include __DIR__ . '/partials/footer.php'; ?>