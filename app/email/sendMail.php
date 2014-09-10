<?php

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

/*
if(empty($request->inputName)){
	$data = array('success' => false, 'message' => 'Ingresa tu nombre');
	echo json_encode($data);
	exit;
}

if(empty($request->inputEmail)){
	$data = array('success' => false, 'message' => 'Ingresa tu correo electrónico');
	echo json_encode($data);
	exit;
}

if(preg_match("/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/",$request->inputEmail)) {
	$data = array('success' => false, 'message' => 'Correo electrónico Inválido');
	echo json_encode($data);
	exit;
}


if(empty($request->inputMessage)){
	$data = array('success' => false, 'message' => 'Ingresa tu mensaje');
	echo json_encode($data);
	exit;
}

*/

if(isset($request->inputName) && isset($request->inputEmail) && isset($request->inputMessage)) {

	//$to = "contacto@hechoencd.mx";
	$to = "ramiro.pacheco@manoderecha.mx";

	$headers = "Content-Type: text/html; charset=UTF-8\n";
	$headers .= "From: " . strip_tags($request->inputName) . " " . strip_tags($request->inputEmail) . "\r\n";
	//$headers .= "Cc: ". strip_tags($request->inputName) . " " . strip_tags($request->inputEmail) . "\r\n";

	$tema = "Mensaje desde el sitio Hecho en #CDMX";

	$mensaje = "<table>";
	$mensaje =   "<tr><td>Nombre: </td><td>" . strip_tags($request->inputName) . "</td></tr>";
	$mensaje .=  "<tr><td>Correo: </td><td>" . strip_tags($request->inputEmail) . "</td></tr>";
	$mensaje .=  "<tr><td>Mensaje: </td><td>" . strip_tags($request->inputMessage) . "</td></tr>";
	$mensjae .= "</table>";	

	if(!mail($to,$tema,$mensaje,$headers)) {
	    $data = array('success' => false, 'message' => 'No se pudo enviar tu mensaje. Inténtalo más tarde.');
		echo json_encode($data);
	    exit;

	} else {

		$data = array('success' => true, 'message' => '¡Tú mensaje ha sido enviado!, en breve nos comunicaremos contigo.');
		echo json_encode($data);
		exit;
	}

} else {

	$data = array('success' => true ,'message' => 'Por favor llena todos los campos.' );
	echo json_encode($data);
	exit;
}