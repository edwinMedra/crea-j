<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../imagen/header/favicon.png" type="image/x-icon">
      <!--Comentario sobre el link para importar la tipografia-->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Bayon&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
      <!--Fin tipografia-->  
      <link rel="stylesheet" href="..//css/header.css">
      <link rel="stylesheet" href="../css/login.css">
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
<!--inicia div de login-->
    <div class="log">
      <div class="left">
        <div class="iniciar">
          <h1>Iniciar sesion</h1>
          <span><img src="..//imagen/login/logito.png" alt=""></span>
        </div>
        <div class="formu">
            <form action="" method="post">
          <input type="text" placeholder="Pasaporte" name="name"><br>
          <input type="password" placeholder="Contraseña" name="pass"><br>
          <div class="crear-1">
            <input type="submit" value="Crear" id="crear">
            <input type="submit" value="Iniciar Sesion" id="crear">
            </form>
        </div><br>
        <?php

//proceso de validacion con el usuario
error_reporting(0);
include ("../php/conex.php");
$name = trim($_POST['name']);
$pass = trim($_POST['pass']);
if (empty($name) || empty($pass)){
  echo "<center><h3>Complete los datos para iniciar sesion</h3></center>";
}else{
    $consulta = "SELECT `pasaporte`, `contrasena` FROM `usuarios` WHERE pasaporte='$name' and contrasena='$pass' ";
    $resul = mysqli_query($conex, $consulta);
    $filas= mysqli_num_rows($resul);
    if ($filas>0){
      header ("Location:../html/index.html");
    }else{
      echo "<center><h3>Datos incorrectos</h3></center>";
    }
}
?>
        </div>
      </div>
      <div class="right">
        <div class="imagen">
          <img src="..//imagen/login/back.png" alt="">
        </div>
      </div>
    </div>
    <!--fin del login-->
</body>
</html>
