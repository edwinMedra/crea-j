<?php
$conex = mysqli_connect("localhost","root","","bd");
if ($conex){
    echo "la conexion a la base es exitosa";
}else{
    echo "Algo esta mal colocado";
}
?>