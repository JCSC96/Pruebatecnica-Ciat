<?php
//////////////conexion a base de datos y creacion de tablas 
	$text='';
	if (isset($_POST["propID"]) && !empty($_POST["propID"])){
		$codigo=$_POST["propID"];
	/////////////// Conexion al servicio de MYSQL
		$localhost = 'localhost';
		$username  = 'root';
		$password  = '';
		$link = mysqli_connect($localhost,$username,$password);

	////////////// Verifica si se establecio la conexion 
		if (!$link) {
			die('No pudo conectarse: ' . mysql_error());
		}

	/////////////Conexion a la base de datos 1
		$bdname1='ubc_animales';
		$bd1 = mysqli_select_db($link,$bdname1);

	////////////// Verifica si se establecio la conexion 
		if (!$bd1) {
			die('No existe la base de datos : ' . mysql_error());
		}

		$sql1="SELECT NOMBRE,ID_LONGITUD,ID_LATITUD FROM propietario_animal where CEDULA=".$codigo;
		$resultado=mysqli_query($link,$sql1);
		
		$resultado3=mysqli_fetch_array($resultado);
		
		
		$sql1="SELECT VALOR FROM latitud where ID=".$resultado3['ID_LATITUD'];
		$resultado=mysqli_query($link,$sql1);
		$valorlatitud1=mysqli_fetch_array($resultado);
		
		$sql1="SELECT VALOR FROM longitud where ID=".$resultado3['ID_LONGITUD'];
		$resultado=mysqli_query($link,$sql1);
		$valorlongitud1=mysqli_fetch_array($resultado);

	/////////////Conexion a la base de datos 2

		$bdname2='zona_desforestacion';
		$bd2 = mysqli_select_db($link,$bdname2);

	////////////// Verifica si se establecio la conexion 
		if (!$bd2) {
			die('No existe la base de datos : ' . mysql_error());
		}

		$sql2="SELECT area_desfo.ID
				FROM area_desfo
				INNER JOIN longitud
				ON area_desfo.ID_LONGITUD = longitud.ID
				INNER JOIN latitud
				ON area_desfo.ID_LATITUD = latitud.ID
				where longitud.VALOR = ".$valorlongitud1['VALOR']." and latitud.VALOR=".$valorlatitud1['VALOR'];
		$resultado2=mysqli_query($link,$sql2);
		$resultado4=mysqli_fetch_array($resultado2);
		$text="";
		if(!empty($resultado4['ID']))
			$text="El(La) propetari@ ".$resultado3['NOMBRE']." tiene sus animales en el terreno con longitud ".$valorlongitud1['VALOR']." y latitud ".$valorlatitud1['VALOR'].", el cual se encuentra en un terreno en desforestación.";
		else
			$text="El(La) propetari@ ".$resultado3['NOMBRE']." tiene sus animales en el terreno con longitud ".$valorlongitud1['VALOR']." y latitud ".$valorlatitud1['VALOR'].", el cual no se encuentra en un terreno en desforestación.";
		//echo("resultado 2: ".$resultado4['ID']);
		mysqli_close($link);

}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>CIAT</title>
</head>
<body>
    <header>
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
              <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">CIAT</span>
              </a>
          
              <ul class="nav nav-pills">
                <li class="nav-item"><a href="index.html" class="nav-link active">Home</a></li>
              </ul>
            </header>
          </div>
          <div class="b-example-divider"></div>
    </header>
    <div class="container">
        <div class="row  align-items-center justify-content-center p-2" >
            <div class="col-sm-6 d-flex justify-content-center">
                <h4>Resultado de Consulta</h4>
            </div>
        </div>
        <div class="row align-items-center justify-content-center p-2">
            <div class="col-sm-6">
               <p>
					<?php echo $text; ?>
			   </p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>