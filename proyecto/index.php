<?php
//incluir la conexion
include ('includes.php');
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);


//creamos una variable para ejecutar la query

$sql = $conexion->query("SELECT * FROM detalles");
$sql_cuadraditos = $conexion->query("SELECT * FROM detalles limit 12");
?>





<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/portada.css" rel="stylesheet" type="text/css">
    <link href="css/menu.css" rel="stylesheet" type="text/css">
    <link href="css/ocho-noticias.css" rel="stylesheet" type="text/css">
    <link href="css/objeto-3d.css" rel="stylesheet" type="text/css">
    <link href="css/redes-sociales.css" rel="stylesheet" type="text/css">
    <link href="css/pie.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../proyecto/img/icono.png">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
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

                    <div id="destacado">

                        <div id="contenedor-galeria3d">
                        <div id="galeria3d">
                    
                            <div><img src="img/el_beso.jpg" > </div>
                            <div><img src="img/el_grito.jpg" > </div>
                            <div><img src="img/senioritas.jpg" > </div>
                            <div><img src="img/sol_naciente.jpg" > </div>



                        </div>
                 
                            </div>
                                <div id="noticia-destacada">
                                    <p class="clear"></p>
                                        <h1>El arte de contemplar</h1>
                                        <h2>Aqui encontrarás varias de las obras mas significativas de las corrientes del impresionimo, expresionimo, cubismo y modernismo</h2>
                           
                              

                            </div>

                </div>
                <div id="ocho-noticias" >


                <?php
          while($row=$sql->fetch_array()){

            $codigo=$row[0];
            $titulo=$row[1];
            $descripcion=$row[2];
            $imagen=$row[3];
            
            ?>


                    <div>
                   

                         <img class="cuadros" src="img/<?php echo $imagen; ?>" alt="">
                       
                        <a class="detalles" href="detalles.php?codigo=<?php echo $codigo ?>"></a>
                            <div class="titulo">
                                <h1><?php echo $titulo; ?></h1>
         
                                <h2><?php echo $descripcion; ?></h2>
                    </div> 
                             
                    </div>
         
                    <?php
}
?>


               </div>
               </div>
                   

                <p class="clear"></p>

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
                            <a href="index.php">Home</a>
                            <a href="http://guillermopg.com.es:8080/PruebaTomcat/WebContent/login.jsp">Login</a>
                            <a href="">Gallery</a>
                            <a href="blog.php">Blog</a>
                            <a href="contacto.php">Contact</a>

                        </div>

                    </div>

               </div> 

    </div>
    
</body>
</html>
<?php
$conexion->close();
?>