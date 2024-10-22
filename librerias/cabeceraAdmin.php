<?php
	session_start();
    if (!isset($_SESSION['usuario'])) {
        header("Location:index.php");
    }

    require_once("bd/settingConexion.php");
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Lotes</title>
        <!--Hojas Estilo-->
        <link rel="stylesheet" href="../css/mainm.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!--Alertas-->
        <link rel="stylesheet" href="../css/sweetalert.css">
        <!--Font Awesome Iconos-->
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <!--Menú-->
        <header>
            <nav class="navbar menuadmin" id="menuAdmin">                
            </nav>
        </header>