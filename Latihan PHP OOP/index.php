<?php
    // Classes Auto Load
    require_once('classes/autoload.php');

    if( isset( $_POST['submit'] ) )
    {
        $add   = Post::add($_POST['judul'], $_POST['konten'], $_POST['penulis']);
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Belajar OOP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <ul>
            <?php
                $post = new Post;
                if(count($post->getAll()) > 0){
                    foreach ($post->getAll() as $data)
                    {
                        echo $data->author . '<br/>';
                    }
                } else {
                    echo "Tidak ada data";
                }
                
            ?>
        </ul>
        <form action='' method='post'>
            <input type="text" name="penulis" placeholder="penulis">
            <input type="text" name="judul" placeholder="judul">
            <input type="text" name="konten" placeholder="konten">

            <input type="submit" name="submit">
        </form>

    </body>
</html>