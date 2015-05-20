$(document).on("ready", function(event){
	var $txtEsp = $("#txtEspanol"),
		$txtKak = $("#txtKaqchikel"),
		isValid = false;

	var $spanEstadoError = $("#isTraduccion"),
		$spanMensajeError = $("#msgError");

	var $spanMensajeSuccess = $("#msgSuccess"),
		$spanInsertSuccess = $("#insertSuccess");

	// Función para validar si el input no está vacío
	function validarCampoVacio(){
		return $(this).val().length !== 0
	}

	// Función para validar los campos al momento de querer traducir
	function validarCamposTraduccion(){
		var traduccion = $(this).val();

		if(traduccion === "ESP"){
			$txtKak.prop("required", true);
			$txtEsp.prop("required", false);
			isValid = validarCampoVacio.call($txtKak);
		}else if(traduccion === "KAQ"){
			$txtEsp.prop("required", true);
			$txtKak.prop("required", false);
			isValid = validarCampoVacio.call($txtEsp);
		}
	}

	// Funcionamiento del botón limpiar
	$("#btnLimpiar").on("click", function(e){
		e.preventDefault();
		e.stopImmediatePropagation();

		// Limpia todos los elementos input del formulario
		$("textarea").html("");
		$txtKak.removeClass("error");
		$txtEsp.removeClass("error");
		$spanMensajeError.addClass("hidden");
		$("#txtTraduccion option[value='KAQ']").attr("selected", "selected");

	});

	// Se verifican los campos requeridos para la traducción según el idioma
	// al que se desee traducir.
	$("#txtTraduccion").on("change", function(e){
		validarCamposTraduccion.call($(this));
		console.log("isValid : " + isValid);
	});

	// Previene que se haga la traducción si no se cumplen los requisitos
	$("#btnTraducir").on("click", function(e){
		validarCamposTraduccion.call($("#txtTraduccion"));
		if(!isValid){
			var traduccion = $("#txtTraduccion").val();
			if(traduccion === "ESP"){
				$txtKak.addClass("error");
				$txtEsp.removeClass("error");
			}else if(traduccion === "KAQ"){
				$txtEsp.addClass("error");
				$txtKak.removeClass("error");
			}
			validarCamposTraduccion.call($("#txtTraduccion"));
			console.log("Imposible traducir. Falta llenar un campo requerido.");
		}
	});

	// Previene que se haga el insert si los campos estan vacios
	$("#btnInsertar").on("click", function(e){
		if(!validarCampoVacio.call($txtEsp) && !validarCampoVacio.call($txtKak)){
			$txtKak.prop("required", true).addClass("error");
			$txtEsp.prop("required", true).addClass("error");
			console.log("No se pueden insertar valores nulos.");
		}
	});

	if($spanEstadoError.text() === "true"){
		$spanMensajeError.removeClass("hidden");
	}else{
		$spanMensajeError.addClass("hidden");
	}

	if($spanInsertSuccess.text() === "true"){
		$spanMensajeSuccess.removeClass("hidden");
	}else{
		$spanMensajeSuccess.addClass("hidden");
	}

});