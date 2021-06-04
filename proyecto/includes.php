<?php
include('includes/conexiones.php');
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);
$conexion = new mysqli ($servidor, $user, $psw, $bd);
if($conexion -> connect_error){die("No se ha podido conectar");}
$conexion->set_charset("utf8");

?>