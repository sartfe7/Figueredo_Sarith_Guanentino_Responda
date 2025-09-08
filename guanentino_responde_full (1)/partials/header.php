<?php
if (!isset($page_title)) $page_title = 'Guanentino Responde';
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php echo htmlspecialchars($page_title); ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="css/app.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center" href="index.php">
      <img src="assets/logo.png" alt="Logo" width="40" height="40" class="me-2">
      Guanentino Responde
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="index.php">Inicio</a></li>
        <li class="nav-item"><a class="nav-link" href="iniciar_secion.php">Iniciar Sesión</a></li>
        <li class="nav-item"><a class="nav-link" href="home_docente.php">Docente</a></li>
        <li class="nav-item"><a class="nav-link" href="home_admin.php">Admin</a></li>
        <li class="nav-item"><a class="nav-link" href="registrar_pregunta.php">Registrar Pregunta</a></li>
        <li class="nav-item"><a class="nav-link" href="registrar_opciones.php">Registrar Opciones</a></li>
        <li class="nav-item"><a class="nav-link" href="saber11.php">Saber 11</a></li>
        <li class="nav-item"><a class="nav-link" href="guanentino_r.php">Guanentino R</a></li>
        <li class="nav-item"><a class="nav-link" href="generalidades_cg.php">Generalidades</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container" style="padding-top:90px;">
