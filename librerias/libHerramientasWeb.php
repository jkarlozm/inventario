<?php
	require_once("../bd/settingConexion.php");

	switch ($_POST["type"]) {
		case 1: //Ingresar Lote
			try {
				$queryConteo="SELECT id_lote FROM Lotes WHERE numero_lote = '".$_POST["lote"]."'";
				if (mysqli_num_rows((mysqli_query($conexion, $queryConteo)))==0) {
					$query = "INSERT INTO Lotes VALUES (NULL,'".$_POST["medicamento"]."', '".$_POST["lote"]."', '".$_POST["fecha"]."', '".date('Y-m-d')."', '".date('Y-m-d')."')";
					mysqli_query($conexion, $query);					
					$response = array(
						'status' => 'success',
						'message' => 'Lote insertado correctamente',
					);
					echo json_encode($response);					
				} else {
					$response = array (
						'status' => 'danger',
						'message' => 'El lote ya existe, ingresa un lote diferente',
					);
					echo json_encode($response);
				}			
				
			} catch (mysqli_sql_exception $e) {
				$response = array(
					'status' => 'error',
					'message' => $e->getMessage()
				);
				echo json_encode($response);
			}
			$conexion->close();
			break;
		case 2: //Mostrar Lotes en tablas
			$rSQLlotes = mysqli_query($conexion, "SELECT l.id_lote, l.numero_lote, m.sku, m.nombre, l.fecha_caducidad, IFNULL(sce.existencia,0) 'Entrada', IFNULL(scs.salidas,0) 'Salida', (IFNULL(sce.existencia,0) - IFNULL(scs.salidas,0)) 'Saldo' FROM Lotes l INNER JOIN Medicamentos m on l.id_medicamento = m.id_medicamento LEFT JOIN (SELECT em.id_lote, SUM(em.cantidad_entrada) AS existencia FROM EntradasMedicamentos em GROUP BY em.id_lote) sce ON l.id_lote = sce.id_lote LEFT JOIN (SELECT sm.id_lote, SUM(sm.cantidad_salida) AS salidas FROM SalidasMedicamentos sm GROUP BY sm.id_lote) scs ON l.id_lote = scs.id_lote");
			
			if (mysqli_num_rows($rSQLlotes) > 0) {
				$contar = 1;
				while ($filaLotes = mysqli_fetch_array($rSQLlotes)) { 
					$button = mysqli_query($conexion, "SELECT * FROM EntradasMedicamentos em WHERE em.id_lote=".$filaLotes["id_lote"]); ?>
					<tr>
						<td class="text-center text-capitalize"><?php echo $contar ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["numero_lote"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["sku"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["nombre"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["fecha_caducidad"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["Entrada"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["Salida"] ?></td>
						<td class="text-center text-capitalize"><?php echo $filaLotes["Saldo"] ?></td>
						<td class="text-center text-capitalize">
							<div class="btn-group" role="group" aria-label="...">
						  		<button type="button" class="btn btn-info" onclick="entradaMedicamento(this.id)" id="<?php echo $filaLotes["id_lote"] ?>"><span class="glyphicon glyphicon-save-file"></span></button>
						  		<button type="button" class="btn btn-warning" onclick="salidaMedicamento(this.id)" id="<?php echo $filaLotes["id_lote"] ?>" <?php echo (mysqli_num_rows($button) == 0) ? 'disabled="disabled"' : ''; ?>><span class="glyphicon glyphicon-open-file"></span></button>
							</div>
						</td>
					</tr>
				<?php 
					$contar++;
				}
				$conexion->close();
				
			} else { ?>
				<tr>
					<td class="text-center text-capitalize" colspan="4">No hay lotes registrados aun.</td>
				</tr>
			<?php }
			
			break;		
		case 4: // Registra entradas
			//Mostrar datos formulario
			$rSQLdatosHerramienta = mysqli_query($conexion, "SELECT l.id_lote, l.numero_lote, l.id_medicamento, m.nombre, l.fecha_caducidad FROM Lotes l INNER JOIN Medicamentos m ON l.id_medicamento = m.id_medicamento WHERE l.id_lote = ".$_POST["idHerramientaM"]);
			while ($filaDatosHerramienta = mysqli_fetch_array($rSQLdatosHerramienta)) {
				$idHerramienta = $filaDatosHerramienta["numero_lote"];
				$nombreHerramienta = $filaDatosHerramienta["nombre"];
				$iconoHerramienta = $filaDatosHerramienta["fecha_caducidad"];
			}
			$datos = array('idh' => $idHerramienta ,'nombreh' => $nombreHerramienta, 'iconoh' => $iconoHerramienta);
			echo json_encode($datos);			
			break;		
		case 6: //Ingresar Entradas
			try {				
				$query = "INSERT INTO EntradasMedicamentos VALUES (null, (SELECT l.id_lote from Lotes l WHERE l.numero_lote='".$_POST["lote"]."'), '".date('Y-m-d')."', '".$_POST["cantidad"]."', 1);";				
				mysqli_query($conexion, $query);
				$response = array(
					'status' => 'success',
					'message' => 'Entrada ingresada correctamente',
				);
				echo json_encode($response);
			} catch (mysqli_sql_exception $e) {
				$response = array(
					'status' => 'error',
					'message' => $e->getMessage()
				);
				echo json_encode($response);
			}
			$conexion->close();
			break;
		case 7: //Infresar Salidas
			try {				
				$query = "INSERT INTO SalidasMedicamentos VALUES (null, (SELECT l.id_lote from Lotes l WHERE l.numero_lote='".$_POST["lote"]."'), '".date('Y-m-d')."', '".$_POST["cantidad"]."', 1);";				
				mysqli_query($conexion, $query);
				$response = array(
					'status' => 'success',
					'message' => 'Entrada ingresada correctamente',
				);
				echo json_encode($response);
			} catch (mysqli_sql_exception $e) {
				$response = array(
					'status' => 'error',
					'message' => $e->getMessage()
				);
				echo json_encode($response);
			}
			$conexion->close();
			break;
		case 8: //Ingresar Salidas
				try {
					//Valida que el valor ingresado es menor al saldo
					$query="SELECT ( SELECT SUM(em.cantidad_entrada) FROM EntradasMedicamentos em WHERE em.id_lote = (SELECT l.id_lote FROM Lotes l WHERE l.numero_lote = '".$_POST["lote"]."') ) -( SELECT SUM(sm.cantidad_salida) FROM SalidasMedicamentos sm WHERE sm.id_lote = (SELECT l.id_lote FROM Lotes l WHERE l.numero_lote = '".$_POST["lote"]."') ) AS Diferencia";					
					$resultado=mysqli_query($conexion, $query);
					if($resultado){
						$fila=mysqli_fetch_assoc($resultado);
						$diferencia = $fila['Diferencia'];						
						if($_POST["cantidad"] > $diferencia){
							$response = array(
								'status' => 'error',
								'message' => 'Solo puedes retirar '.$diferencia.' y estas pidiendo '.$_POST["cantidad"],
							);							
						} else {
							//Ingresa salida
							$query = "INSERT INTO SalidasMedicamentos VALUES (null, (SELECT l.id_lote from Lotes l WHERE l.numero_lote='".$_POST["lote"]."'), '".date('Y-m-d')."', '".$_POST["cantidad"]."', 1);";				
							mysqli_query($conexion, $query);
							$response = array(
								'status' => 'success',
								'message' => 'Entrada ingresada correctamente',
							);							
						}
						echo json_encode($response);					
					} 					
				} catch (mysqli_sql_exception $e) {
					$response = array(
						'status' => 'error',
						'message' => $e->getMessage()
					);
					echo json_encode($response);
				}
				$conexion->close();
				break;
	}
?>