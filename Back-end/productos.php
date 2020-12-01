<?php
    class Producto{

        // database connection and table name
        private $conn;
        private $table_name = "producto";
      
        // object properties
        public $producto;
        // constructor with $db as database connection
        public function __construct($db){
          $this->conn = $db;
        }
      
            // object properties
         
          public $id;
          public $nombre;
          public $precio;
          public $descrip;
          public $cantVendida;
          public $imagen;
          public $tipo;
          public $cantidad;

      
       
          //Leer
          public function Listar(){
                      // select all query
                      $query = "SELECT * FROM $this->table_name";
      
                  // prepare query statement
                  $stmt = $this->conn->query($query);
      
                  // execute query
                  //$stmt->fetch_assoc();
      
                  return $stmt;
          }

      
      }
?>