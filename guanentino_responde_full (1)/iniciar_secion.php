<?php $page_title = "Iniciar Secion"; include __DIR__ . '/partials/header.php'; ?>
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
       <header>
           <h1>🌸 Bienvenido a ¡Guanentino, Responda! 🌸</h1>
           <h3>Selecciona tu perfil para iniciar sesión</h3>
       </header>
       

       <!-- Opciones de login -->
       <div class="roles horizontal">
           <div class="role-card">
               <img src="img/admin.png" alt="Admin">
               <a href="modelo/login_admin.php" class="btn">👑 Admin</a>
           </div>

           <div class="role-card">
               <img src="img/docente.png" alt="Docente">
               <a href="modelo/login_docente.php" class="btn">📘 Docente</a>
           </div>

           <div class="role-card">
               <img src="img/digitador.png" alt="Digitador">
               <a href="modelo/login_digitador.php" class="btn">⌨️ Digitador</a>
           </div>
           
       </div>
   </div>
    </div>
  </div>
</div>
<?php include __DIR__ . '/partials/footer.php'; ?>