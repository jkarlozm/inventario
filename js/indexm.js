//Carga las Funciones Principales
$(document).ready(muestraHerramientas());

/* ==========================================================================
   Inicio y Cierre de Sesión
   ========================================================================== */
//Log in
$("#login").click(function () {
	if (($("#user").val() != "") && ($("#pass").val() != "")) {
		$.ajax({
			data: {u: $("#user").val(), p: $("#pass").val(), type: 1},
			url: '../librerias/sesion.php',
			type: 'POST',
			success: function (response) {
				console.log(response);
				switch(response){
					case '1':
						window.location='extras.php';
						break;
					case '2':
						window.location='index.php';
						break;
				}
			}
		});
	} 
	else{ swal("UPS!!", "Hay campos vacios", "info");}
});

//Sing Out
function  cerrarSesion() {	
	$.ajax({
		data: {type: 2},
		url: '../librerias/sesion.php',
		type: 'POST',
		success: function (response) {
			window.location='index.php';
		}
	});
};

/* ==========================================================================
   CRUD Lotes
   ========================================================================== */
//Función para mostar alerta
function mostrarAlertas(tipo, mensaje) {	
	$("#mensajeHerramientas").html('<div class="alert alert-'+tipo+' alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><div>'+mensaje+'</div></div>');
}

//Muestra Formulario Lotes
$("#muestraFormulario").click(function(){
	$(this).toggleClass('glyphicon-collapse-up');
	$("#formHerramientas").toggle('slow');
	$("#txt_nombreHerramienta, #txt_iconoHerramienta").val('');
});

//Agregar Nuevo Lote
$("#guardarHerramienta").click(function(){
	var confirmar = $("#txt_lote").val().length * $("#txt_medicamento").val().length * $("#txt_caducidad").val().length;
	if(confirmar != 0){		
		$.ajax({
			type: "POST",
			url: "../librerias/libHerramientasWeb.php",
			data: {type: 1, lote: $("#txt_lote").val(), medicamento: $("#txt_medicamento").val(), fecha: $("#txt_caducidad").val()},
			dataType: 'json',
			success: function(response){
				console.log(response);				
				if (response.status === 'success') {					
					mostrarAlertas(response.status, response.message);
					$("#txt_lote, #txt_medicamento, #txt_caducidad").val('');
					muestraHerramientas();
				} else {					
					mostrarAlertas(response.status, response.message);
					console.error('error: ' + response.message);
				}						
				
			},
			error: function(xhr, status, error){
				console.error('Error en la peticion ajax: ' + error);
				alert('Hubo un error, consulte la consola');								
			}			
		})
	}
	else{
		swal("Hay campos vacios", "Favor de llenar todos", "info");
	}
});

//Muestra Lotes en Tabla
function muestraHerramientas(){
	$.ajax({
		type: "POST",
		url: "../librerias/libHerramientasWeb.php",
		data: {type: 2},
		success: function(response){
			$("#muestraHerramientas").html(response);
		}
	})
};

//Salida Medicamento
function salidaMedicamento(idHerramientaM){	
	$.ajax({
		type: "POST",
		url: "../librerias/libHerramientasWeb.php",
		data: {type: 4, idHerramientaM: idHerramientaM},
		dataType: "json",		
		success: function(response){
			$("#txt_Cantidad").val('');
			$("#guardarEntrada").hide();
			$("#guardarSalida").show();
			$("#myModalLabel").text("Salida Medicamento");
			$("#txt_Lote").val(response.idh);
			$("#txt_Medicamento").val(response.nombreh);
			$("#txt_Caducidad").val(response.iconoh);
			$("#myModal").modal('show');
		}
	})
};

//Entradas Medicamento
function entradaMedicamento(idHerramientaM){		
	$.ajax({
		type: "POST",
		url: "../librerias/libHerramientasWeb.php",
		data: {type: 4, idHerramientaM: idHerramientaM},
		dataType: "json",		
		success: function(response){
			$("#txt_Cantidad").val('');
			$("#guardarSalida").hide();
			$("#guardarEntrada").show();
			$("#myModalLabel").text("Ingreso Medicamento");			
			$("#txt_Lote").val(response.idh);
			$("#txt_Medicamento").val(response.nombreh);
			$("#txt_Caducidad").val(response.iconoh);
			$("#myModal").modal('show');
		}
	})
};

//Actualiza Herramientas web
$("#actualizarHerramienta").click(function(){	
	var confirmar = $("#txt_nombreHerramienta").val().length * $("#txt_iconoHerramienta").val().length;
	if(confirmar != 0){
		$.ajax({
			type: "POST",
			url: "../librerias/libHerramientasWeb.php",
			data: {type: 5, nombre: $("#txt_nombreHerramienta").val(), icono: $("#txt_iconoHerramienta").val(), id: $("#txt_idHerramientaWeb").val()},
			success: function(response){				
				switch(response){
					case "1":
						$("#mensajeHerramientas").addClass("alert alert-success alert-dismissible");
						$("#mensajeHerramientas").html("Herramienta actualizada de manera correcta");
						$("#mensajeHerramientas").append('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
						$("#txt_nombreHerramienta, #txt_iconoHerramienta").val('');
						muestraHerramientas();
						break;
					case "2":
						$("#mensajeHerramientas").addClass("alert alert-warning alert-dismissible");
						$("#mensajeHerramientas").html("¡Error! al actualizar el registro");
						$("#mensajeHerramientas").append('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
						break;
				}
			}
		})
	}
	else{
		swal("Hay campos vacios", "Favor de llenar todos", "info");
	}
});

//Agregar entradas
$("#guardarEntrada").click(function() {	
	var campoVacio = $("#txt_Cantidad").val().length;
	if(campoVacio != 0){
		$.ajax({
			type: "POST",
			url: "../librerias/libHerramientasWeb.php",
			data: {type: 6, lote: $("#txt_Lote").val(), cantidad: $("#txt_Cantidad").val()},
			dataType: 'json',
			success: function(response){
				console.log(response);
				if (response.status === 'success') {
					alert(response.message);
					$("#myModal").modal('hide');					
					muestraHerramientas();
				} else  {
					alert(response.message);
					console.error('error: ' + response.message);
				}
			},
			error: function(xhr, status, error) {
				console.error('Error en la petición ajax: ' + error);
				alert('Hubo un error, consulte la consola');				
			}
		})
	} else{
		swal("El campo cantidad esta vacio", "Favor de llenarlo", "info");
	}
});

//Agregar salidas
$("#guardarSalida").click(function() {	
	var campoVacio = $("#txt_Cantidad").val().length;
	if(campoVacio != 0){
		$.ajax({
			type: "POST",
			url: "../librerias/libHerramientasWeb.php",
			data: {type: 8, lote: $("#txt_Lote").val(), cantidad: $("#txt_Cantidad").val()},
			dataType: 'json',
			success: function(response){				
				if (response.status === 'success') {
					alert(response.message);
					$("#myModal").modal('hide');					
					muestraHerramientas();
				} else  {
					alert(response.message);
					console.error('error: ' + response.message);
				}
			},
			error: function(xhr, status, error) {
				console.error('Error en la petición ajax: ' + error);
				alert('Hubo un error, consulte la consola');				
			}
		})
	} else{
		swal("El campo cantidad esta vacio", "Favor de llenarlo", "info");
	}
});
