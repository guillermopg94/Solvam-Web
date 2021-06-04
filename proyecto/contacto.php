<?php
//incluir la conexion
include ('includes.php');
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);


//creamos una variable para ejecutar la query
$sql = $conexion->query("SELECT * FROM articulos join categorias on articulos.categorias=categorias.id_categoria ");
$sql_cuadraditos = $conexion->query("SELECT * FROM detalles limit 12");
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/portada.css" rel="stylesheet" type="text/css">
    <link href="css/menu.css" rel="stylesheet" type="text/css">
    <link href="css/detalles.css" rel="stylesheet" type="text/css">
    <link href="css/contacto.css" rel="stylesheet" type="text/css">
    <link href="css/redes-sociales.css" rel="stylesheet" type="text/css">
    <link href="css/pie.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon"  type="image/png" href="../proyecto/img/icono.png">
    <title>Proyecto web</title>
</head>
<body>
    <div id="contenedor">
        <div id="encabezado">
            <div id="logo">

                    <img class="logo" src="img/1.png" alt="">

            </div>

            <?php
            include ('menu.php');
            ?>
            <p class="clear"></p>
               <div id="contenido">

                        <div class="texto">
                            <h1>CONTACTA CON NOSOTROS</h1>
                            <p>bla lbla bla bla bla bla bla bla bla bla bla lba lbal bla  bla bla bla bla bla bla bla lba lbal b
                                bla bla bla bla bla bla bla lba lbal blba bla lba bla basl 
                                bla bla bla bla bla bla bla lba lbal b
                                ab laflacl lasflasfl lasflasfl asfasflv lASFLAsfl laflafl lasfasflx </p>
                        </div>
                        <div class="formulario">
                            <form action="ejemplo.php" method="get">
                                <span class="name"></span>  <input class="name" type="text" name="name" size="40" placeholder="Name">
                            </br>
                            </br>
                                <span class="email"></span> <input class="email" type="text" name="email" size="40" placeholder="Email ">
                            </br>
                            </br>
                                <span class="web"></span> <input class="web" type="text" name="web" size="40" placeholder="Website URL">
                            </br>
                            </br>
                                <textarea class="texto" name="texto" rows="4" cols="40" ></textarea>
                            </br>
                            </br>
                                <input class="boton" type="submit" value="Send Message">
                              
                              </form>

                        </div>
                        <div class="datos-contacto">
                            <h1>DATOS DE CONTACTO</h1>
                            <p>SOLVAM</p>
                            <p>Cervante, 3</p>
                            <p>Quart de Poblet - 46930</p>
                            <p>P:Tel: 96 154 77 93</p>
                            </br>
                            <p>Lorenzo Sanchez</p>
                            <p>lorenzo@gmail.com</p>
                            <a href="https://guillermopg.com.es/proyecto/index.php">volver</a>
                        </div>
                        <div class="donde-estamos">
                            <h1>DONDE ESTAMOS</h1>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3079.4032615909327!2d-0.44258908514421846!3d39.48280787948471!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd604ff779223b39%3A0xc60596edf6e35ebd!2sCentro%20de%20FP%20SOLVAM!5e0!3m2!1ses!2ses!4v1620890790559!5m2!1ses!2ses" width="350" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

                        </div>
                
               </div> 

               <div id="pie">
                <div class="pie-peque">
                    <p> SOBRE NOSOTROS</p>
                    <img class="logo" src="img/1.png" alt="">
                </br>
                </br>
                    <p>Calle Cervantes, 3, 46930 Quart de Poblet, Valencia, Spain</p>
                  <span class="rs1"></span>
                  <span class="rs2"></span>
                  <span class="rs3"></span>
                  <span class="rs4"></span>
                  <span class="rs5"></span>
                  
                    </div>
                <div class="pie-peque">

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3079.4032615909327!2d-0.44258908514421846!3d39.48280787948471!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd604ff779223b39%3A0xc60596edf6e35ebd!2sCentro%20de%20FP%20SOLVAM!5e0!3m2!1ses!2ses!4v1620890790559!5m2!1ses!2ses" width="280" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
                <div class="pie-peque">
                    <p> FROM MOST CURRENT TO OLDER</p>
                    <?php
                    $sqlmasantiguos=$conexion->query("SELECT * FROM articulos ORDER BY fecha DESC limit 4")or die($conexion->error);
                        while($row=$sqlmasantiguos->fetch_array()){
                            $id_articulo=$row[0];
                            $titulo=$row[1];
                            $articulo=$row[2];
                            $autor=$row[3];
                            $fecha=$row[4];
                            $etiquetas=$row[5];
                            $categorias=$row[6];
                            $foto=$row[7];
                            $visitas=$row[8];

                            ?>
</br>
<a href="blog.php?id_articulo=<?php echo $id_articulo;?>"> <?php echo $titulo;?></a>
                        </br>
                       
                        
      <?php
}
?>
                </div>
                <div class="pie-peque">
                    <p> FLICKR PHOTOS</p>
                    <?php
                        while($row=$sql_cuadraditos->fetch_array()){
                            

                    $imagen=$row[3];

                            ?>
                            <div class="cuadraditos">
                           
                            <img src="img/<?php echo $imagen ?>" alt=""> 
                            
                            </div>
                            <?php
}
?>

                   
                </div>
                <p class="clear"></p>
                <div class="pie-completo">
                    <p class="copy">Copyright 2017 SOLVAM. All rights reserved.</p>
                    <a href="index.php"> Home </a>
                    <a href="http://guillermopg.com.es:8080/PruebaTomcat/WebContent/login.jsp"> Login </a>
                    <a href=""> Gallery</a>
                    <a href="blog.php"> Blog </a>
                    <a href="contacto.php"> Contact </a>

                </div>

            </div>    


    </div>
    
</body>
</html>