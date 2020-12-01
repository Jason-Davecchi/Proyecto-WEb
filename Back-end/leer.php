<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// database connection will be here

// include database and object files
include_once './db.php';
include_once './usuario.php';
 
// instantiate database and product object
$database = new Conectar();
$db = $database->conexion();
$Json = file_get_contents('php://input');
$params = json_decode($Json);
// initialize object
$usuarios = new Usuario($db);
 
// read products will be here
// query products
$stmt = $usuarios->Listar($rut=$params->rut,$contrasena=$params->contrasena);
$num = $stmt->num_rows;
 
// check if more than 0 record found
if($num>0){
 
    // products array

    $row = $stmt->fetch_assoc();
 
    $testing = $row['rut'];

 
    // set response code - 200 OK
    http_response_code(200);
 
    echo json_encode($testing);
    
}else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no user found
    echo json_encode(
        array("message" => "No user found.")
    );
    
}