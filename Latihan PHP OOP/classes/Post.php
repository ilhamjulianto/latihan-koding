<?php
    require_once('Database.php');

    class Post extends DB {

        public function add($title, $content, $writer)
        {
            $konek  = DB::pdo();
            $query  = "INSERT INTO posts (judul, konten, author, timestamp) 
                       VALUES ('$title', '$content', '$writer', CURRENT_TIMESTAMP)";
            try {
                $konek->exec($query);
                echo "Berhasil ditambahkan";
            } catch (PDOException $error) {
                echo $error->getMessage();
            }
        }

        public function getAll()
        {
            $konek      = DB::pdo();
            $query      = "SELECT * FROM posts";
            $retrieve   = $konek->query($query)->fetchAll();

            return $retrieve;
        }
    }
    
?>
