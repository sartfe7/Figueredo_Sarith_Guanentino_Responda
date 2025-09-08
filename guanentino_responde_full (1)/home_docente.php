<?php $page_title = "Home Docente"; include __DIR__ . '/partials/header.php'; ?>
<div class="row justify-content-center">
  <div class="col-lg-10">
    <div class="card p-4 mb-4">
      <?php if(isset($_GET['exito'])): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    ¡Operación realizada con éxito!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<?php endif; ?>
      </head>
    </div>
  </div>
</div>
<?php include __DIR__ . '/partials/footer.php'; ?>