
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/registro.css">
    <link rel="stylesheet" href="../css/header.css">
     <!--Comentario sobre el link para importar la tipografia-->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Bayon&display=swap" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
     <!--Fin tipografia--> 
     <link rel="shortcut icon" href="../imagen/header/favicon.png" type="image/x-icon">
    <title>ESFLY</title>
</head>
<body>
    <header>
        <div>
        <span id="logo"><img src="../imagen/Header/Logo.png" alt=""></span>
        <span class="part-list">
            <div class="texto1">RESERVA TU VUELO</div>
            <div class="barita-azul"><img src="../imagen/header/barrita-azul.png" alt="Barra Azul"></div>
        <div class="texto2">OFERTAS Y DESTINOS</div>
        <div class="barita-azul-1"><img src="../imagen/header/barrita-azul.png" alt="Barra Azul"></div>
        <div class="texto3">CHECK-IN</div>
        <div class="barita-azul-2"><img src="../imagen/header/barrita-azul.png" alt="Barra Azul"></div>
        <div class="texto4">LOGIN</div>
        <div class="barita-azul-3"><img src="../imagen/header/barrita-azul.png" alt="Barra Azul"></div>
        </span>
        <!--Parte de lista -->
    <label for="menu"><span id="lupi"><img src="../imagen/header/manu hamburger.png" alt="" id="hamburger-1"></span></label>    
    
        <span id="lupi"><img src="../imagen/header/lupita.png" alt=""></span>
        <input type="checkbox" name="" id="menu">
        <div class="menu-list">
            <ul>
                <li>RESERVA TU VUELO</li><hr>
                <li>OFERTAS Y DESTINOS</li><hr>
                <li>CHECK-IN</li><hr>
                <li>LOGIN</li><hr>
            </ul>
        </div>
    </div>
    </header> 
    <!--Inicia registro-->
    <div class="padre">
        <div class="imagen">
            <img src="..//imagen/Registro/image 26.png" alt="">
        </div>
        <div class="formu">
            <h2>Crear Cuenta</h2>
            <span class="login">
                <img src="..//imagen/Registro/logito.png" alt="" class="logito">
            </span>
            <form action="" method="POST">
                <input type="text" placeholder="Nombre" name="name"><br>
                <input type="text" placeholder="Apellido" name="lastname"><br>
                <input type="password" id="" placeholder="Contraseña" name="pass"><br>
                <input type="email" id="" placeholder="Correo" name="mail"><br>
                <input type="number" name="passport" maxlength="3" id="" placeholder="Pasaporte" ><br>
                <input type="text" id="" name="dui" placeholder="DUI"><br>
                <div class="crear-1">
                    <input type="submit" value="Crear" id="crear" name="enviar">
                    <h4>Iniciar Sesion</h4>

                </div>
            </form>
        </div>
    </div>
</body>
</html>
<?php
//Inicia proceso de registro de datos de usuarios
include ("../php/conex.php");
//tomar datos de los inputs
error_reporting(0);
$name = trim($_POST['name']);
$lastname = trim($_POST['lastname']);
$pass = trim($_POST['pass']);
$mail = trim($_POST['mail']);
$passport = trim($_POST['passport']);
$dui = trim($_POST['dui']);
//validar datos
if (empty($name) || empty($lastname) ||empty($pass) ||empty($mail) ||empty($passport) || empty($dui)){
    echo "<center>Todos los campos son obligatorios</center>";
}else{
    //insertar a la base de datos
    $sql = "INSERT INTO `usuarios`(`nombre`, `apellido`, `contrasena`, `correo`, `pasaporte`, `dui`) VALUES ('$name','$lastname','$pass','$mail','$passport','$dui')";
    $resul = mysqli_query($conex,$sql);
    if ($resul){
        echo "<center>Usuario Registrado con exito</center>";
    }else{
        echo "<center>Error al insertar datos, comunicarse con el soporte de la pagina web</center>";
    }
}
?>