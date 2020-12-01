<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once './db.php';
include_once './usuario.php';
 
$database = new Conectar();
$db = $database->conexion();
 
$usuarios = new Usuario($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"),true);

// make sure data is not empty
if(
    !empty($data["rut"]) &&
    !empty($data["nombre"]) &&
    !empty($data["correo"] &&
    !empty($data["contrasena"]))
){
 
    // set product property values
    $usuarios->rut = $data["rut"];
    $usuarios->nombre = $data["nombre"];
    $usuarios->correo = $data["correo"];
    $usuarios->contrasena = $data["contrasena"];
  
 
    if($usuarios->Crear()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "datos creados"));
    }
 
    // if unable to create the product, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "No se ha podido crear"));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "incompleto campos."));
}
?>