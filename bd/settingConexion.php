<?php
    date_default_timezone_set('America/Mexico_City');
    $conexion = mysqli_connect('mysql:3306', 'medicaljac', 'jac', 'inventariomedicalJAC') or die (mysqli_error($conexion));
    mysqli_set_charset($conexion, "utf8");
?>
