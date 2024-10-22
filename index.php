<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Bienvenido</title>
	<link rel="stylesheet" href="../css/animate.css">
	<link rel="stylesheet" href="../css/mainm.css">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../css/sweetalert.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
	<body class="index">
		<section class="container session">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-info animated fadeInDown">
					  <div class="panel-heading">
					    <h3 class="panel-title text-center">Acceso</h3>
					  </div>
					  <div class="panel-body">					  	
					    <form>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
									<input type="text" id="user" class="form-control" placeholder="Usuario">
								</div>							
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
									<input type="password" id="pass" class="form-control" placeholder="Contraseña">
								</div>
							</div>
							<div class="form-group text-right">
								<button type="button" class="btn btn-success" id="login"><span class="glyphicon glyphicon-log-in"></span> Ingresar</button>
							</div>
						</form>
					  </div>
					  <div class="panel-footer text-center">Karloz Web &copy;</div>
					</div>					
				</div>
			</div>			
		</section>			
	</body>
	<script src="../js/vendor/jquery.js"></script>
	<script src="../js/indexm.js"></script>
	<script src="../js/vendor/sweetalert.min.js"></script>
</html>
