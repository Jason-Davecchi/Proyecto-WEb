<?php
class Usuario{

  // database connection and table name
  private $conn;
  private $table_name = "usuario";

  // object properties
  public $usuarios;
  // constructor with $db as database connection
  public function __construct($db){
    $this->conn = $db;
  }

      // object properties
   
    public $rut;
    public $nombre;
    public $correo;
    public $contrasena;

 
    //Leer
    public function Listar($rutIngresado,$contrasenaIngresada){
                // select all query
                $query = "SELECT rut,nombre,correo,contrasena FROM . $this->table_name  WHERE rut = '$rutIngresado' AND contrasena = '$contrasenaIngresada'";

            // prepare query statement
            $stmt = $this->conn->query($query);

            // execute query
            //$stmt->fetch_assoc();

            return $stmt;
    }

    public function Crear(){

         // sanitize
     $this->rut=htmlspecialchars(strip_tags($this->rut));
     $this->nombre=htmlspecialchars(strip_tags($this->nombre));
     $this->correo=htmlspecialchars(strip_tags($this->correo));
     $this->contrasena=htmlspecialchars(strip_tags($this->contrasena));
        // select all query
        $query = "INSERT INTO
                        " . $this->table_name . "(rut, nombre, correo, contrasena)values('$this->rut','$this->nombre','$this->correo','$this->contrasena')";
         
     
     // execute query

     $stmt = $this->conn->query($query);
     if($stmt){
         return true;
     }
  
     return false;
}


}
?>