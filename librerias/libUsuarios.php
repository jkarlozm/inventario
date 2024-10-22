<?php
	require_once("../bd/settingConexion.php");

	switch ($_POST["type"]) {
		case 1:
			//Mostrar todos los usuarios
			$rSQlusuarios = mysqli_query($conexion, "SELECT * FROM usuarios ");
			if (mysqli_num_rows($rSQlusuarios) > 0) {
				$contador = 1;
				while ($filaUsuarios = mysqli_fetch_assoc($rSQlusuarios)) { ?>
					<tr>
						<td class="text-center text-capitalize"><?php echo $contador ?></td>
						<td class="text-center text-capitalize"><?php echo $filaUsuarios["Nombre_completo"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaUsuarios["Usuario"] ?></td>
						<td class="text-center text-capitalize">
							<div class="btn-group" role="group" aria-label="...">
						  		<button type="button" class="btn btn-info" onclick="modificarUsuario(this.id)" id="<?php echo $filaUsuarios["ID"] ?>">
						  			<span class="fa fa-pencil-square-o"></span>
						  		</button>
						  		<button type="button" class="btn btn-warning" onclick="eliminarUsuario(this.id)" id="<?php echo $filaUsuarios["ID"] ?>">
						  			<span class="fa fa-trash"></span>
						  		</button>
						  		<button type="button" class="btn btn-danger" onclick="cambiarContrasena(this.id)" id="<?php echo $filaUsuarios["ID"] ?>">
						  			<span class="fa fa-key"></span>
						  		</button>
							</div>							
						</td>
					</tr>
				<?php $contador++; }
			} else { ?>
				<tr>
					<td colspan="4" class="text-center text-capitalice">no hay usuarios registrados</td>
				</tr>
			<?php }
			
			
			break;
		case 2:
			//Registrar Usuario
			if(mysqli_query($conexion, "INSERT INTO sesion VALUES(null, '".$_POST["nombre"]."', '".$_POST["name"]."', md5('".$_POST["pass"]."'))")){
				echo "1";
			}
			else{
				echo "2";
			}
			break;
		case 3:
			//eliminar usuario
			if (mysqli_query($conexion, "DELETE FROM sesion WHERE id_sesion = ".$_POST["idUsuario"])) {
				echo "1";
			} else {
				echo "2";
			}
			
			break;
		case 4:
			//Mostrar datos de usuario
			$rSQLusuario = mysqli_query($conexion, "SELECT * FROM sesion WHERE id_sesion = ".$_POST["idUsuario"]);
			while ($filaUsuario = mysqli_fetch_assoc($rSQLusuario)) {
				$id = $filaUsuario["id_sesion"];
				$nombre = $filaUsuario["nombreUsuario"];
				$usuario = $filaUsuario["user"];
			}
			$datosUsuario = array('id' => $id, 'nombre' =>  $nombre, 'usuario' => $usuario);
			echo json_encode($datosUsuario);
			break;
		case 5:
			//Actualizar datos de usuario
			if(mysqli_query($conexion, "UPDATE sesion SET nombreUsuario = '".$_POST["nombre"]."', user = '".$_POST["user"]."' WHERE id_sesion = ".$_POST["id"])){
				echo "1";
			}
			else{
				echo "2";
			}
			break;
		case 6:
			//Actualizar contraseña
			if(mysqli_query($conexion, "UPDATE sesion SET pass=md5('".$_POST["pass"]."') WHERE id_sesion = ".$_POST["id"])){
				echo "1";
			}
			else{
				echo "2";
			}
			break;
	}
?>