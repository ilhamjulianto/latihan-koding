<?php
    class DB {
        public static function mysqli()
        {
            $server      = 'localhost';
            $user        = 'hizzely';
            $password    = 'password';
            $db          = 'database';

            $connect = mysqli_connect($server, $user, $password, $db);
            if($connect->connect_error){
                echo "Error: ";
            }
            return $connect;
        }

        public static function pdo()
        {
            $server      = '127.0.0.1';
            $user        = 'hizzely';
            $password    = 'password';
            $db          = 'database';

            try{
                $connect = new PDO("mysql:host=$server; dbname=$db", $user, $password);
                $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $connect->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
                return $connect;
            } 
            
            catch(PDOException $error) {
                echo $error->getMessage();
                die();
            }   
        }
    }
?>
