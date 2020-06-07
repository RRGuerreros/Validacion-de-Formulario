<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/validacion/fv.css">

<link rel="stylesheet" type="text/css" href="/validacion/bootstrap.min.css">

<script type="text/javascript" src="/validacion/jquery.min.js"></script>
<script type="text/javascript" src="/validacion/bootstrap.min.js"></script>

<script type="text/javascript" src="/validacion/utils.js"></script>
<script type="text/javascript" src="/validacion/validator.js"></script>


</head>
<body>

	<div class="container" style="margin-top: 50px; padding-bottom: 1000px;">
	
		<h2>Validación de Formulario</h2>
		<hr>
		
		<form class="mode2" novalidate="novalidate">
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">EXP REG. Minimo y Maximo de caracteres</label>
				<div class="item col-xs-12 col-md-6">
					<input type="text" class="form-control" required="required" pattern="^[\s\S]{5,10}$" 
						data-message="minimo 5 caracteres,maximo 10 caracteres" >
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Nombre</label>
				<div class="item col-xs-12 col-md-6">
					<input type="text" class="form-control" required="required" data-validate-length-range="1,10">
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Minima y Maxima longitud</label>
				<div class="item col-xs-12 col-md-6">
					<input type="text" class="form-control" required="required" data-validate-length-range="1,10">
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Nombre</label>
				<div class="item col-xs-12 col-md-6">
					<input type="text" data-validate-words="2" 
						placeholder="ex. John f. Kennedy" required="required" class="form-control"/>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Campo Opcional</label>
				<div class="item col-xs-12 col-md-6">
					<input class='form-control optional' name="occupation" data-validate-length-range="5,15" type="text" />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Correo Electronico</label>
				<div class="item col-xs-12 col-md-6">
					<input name="email_usuario" class='form-control email' required="required" type="email" />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Confirmar Correo Electrónico</label>
				<div class="item col-xs-12 col-md-6">
					<input type="email" class='form-control email' name="confirm_email" data-validate-linked='email_usuario' required='required'>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Número</label>
				<div class="item col-xs-12 col-md-6">
					<input type="number" class='form-control number' name="number" data-validate-minmax="10,100" required='required'>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Fecha</label>
				<div class="item col-xs-12 col-md-6">
					<input class='form-control date' type="date" name="date" required='required'>
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Password</label>
				<div class="item col-xs-12 col-md-6">
					<input type="password" class="form-control" name="password_usuario" data-validate-length="6,8" required='required'>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Repite el Password</label>
				<div class="item col-xs-12 col-md-6">
					<input class="form-control" type="password" data-validate-linked='password_usuario' required='required'>
				</div>
				
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Campo Selector</label>
				<div class="item col-xs-12 col-md-6">
					<select class="form-control" name="dropdown" required="required">
						<option value="">-- please select --</option>
						<option value="o1">Option 1</option>
						<option value="o2">Option 2</option>
						<option value="o3">Option 3</option>
					</select>
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">URL</label>
				<div class="item col-xs-12 col-md-6">
					<input class="form-control" name="url" placeholder="http://www.website.com" required="required" type="url" />
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Checkbox</label>
				<div class="item col-xs-12 col-md-6">
					<input type="checkbox" required="required"/>
					<span>&nbsp;Aceptar términos y condiciones</span>
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Archivo</label>
				<div class="item col-xs-12 col-md-6">
					<input type='file' required="required">
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-xs-12 col-md-2">Area de Texto</label>
				<div class="item col-xs-12 col-md-6">
					<textarea style="width: 100%;" class="form-control" required="required" name='message'></textarea>
				</div>
			</div>
			
			<button type='submit'>Enviar</button>
			<button type='reset'>Resetear</button>
		</form>
	</div>
	<script>
	
		var validator = new FormValidator({"events" : ['blur', '', 'change']}, document.forms[0]);

		// on form "reset" event
        document.forms[0].onreset = function(e){
            validator.reset();
        };

     	// on form "submit" event
		document.forms[0].onsubmit = function(e){
			var submit = true,
				validatorResult = validator.checkAll(this);

			console.log(validatorResult);

			if( !validatorResult.valid ){
				alert("Revisar la consola para ver las validaciones ocacionadas.")
			} else {
				alert("Campos completados correctamente...!!!")
			}
			
			return !!validatorResult.valid;
		};
	</script>

</body>
</html>