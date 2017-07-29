<?php
class APIConfig {

    protected $api_baseURL          = 'https://www.googleapis.com/blogger/v3/blogs';
    protected $api_key              = '<KEY API MU DISINI>';
    protected $api_getpost_params   = "posts?maxResults=3&labels=Jobsheet";
    
    protected static function DB() {
        $host     = '127.0.0.1';
        $username = 'hizzely';
        $password = 'password';
        $database = 'database';

        try {
            $connect = new PDO("mysql:host=$host; dbname=$database", $username, $password);
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

class Blogger extends APIConfig {

    public function getpost($blogID)
    {
        /* ---------------------------------------------------------------------------------
            Memanggil Blogger API v3 dengan CURL.
            Pengaturan parameter ada di class parent nya.
        */
        
            $api = curl_init($this->api_baseURL .'/'. $blogID .'/'. $this->api_getpost_params .'&key='.$this->api_key);
            curl_setopt($api, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($api, CURLOPT_HTTPHEADER, array('Content-Type: application/json',));

            $data = curl_exec($api);
            $info = curl_getinfo($api);
            curl_close($api);

        // ---------------------------------------------------------------------------------

        /* ---------------------------------------------------------------------------------
            Apakah respon API nya Success / 200 ?
            Jika IYA akan me-return data ke view dan menyimpan 
            atau mengupdate data yang didapat ke database.
         */

            if ($info['http_code'] === 200){
                $result = json_decode($data);
                $konek  = APIConfig::DB();

                $sql    = "INSERT INTO portal 
                           SET postID = :id, 
                               postTitle = :title, 
                               postAuthor = :author, 
                               postLink = :url, 
                               published_at = :published, 
                               created_at = CURRENT_TIMESTAMP, 
                               updated_at = CURRENT_TIMESTAMP";

                $sql2   = "UPDATE portal 
                           SET postTitle    = :title, 
                               postAuthor   = :author, 
                               postLink     = :url, 
                               published_at = :published 
                           WHERE postID = :id";

                $i_sql  = $konek->prepare($sql);
                $u_sql  = $konek->prepare($sql2);

                foreach ($result->items as $data){
                    $array = array(
                        ':id'        => $data->id,
                        ':title'     => $data->title,
                        ':author'    => $data->author->displayName,
                        ':url'       => $data->url,
                        ':published' => str_replace('T', ' ', $data->published)
                    );

                    $c_sql = $konek->query("SELECT postID 
                                            FROM portal 
                                            WHERE postID = '".$data->id."'"
                                            )->rowCount();

                    if($c_sql === 0){
                        echo "[INFO] Post ID: " . $data->id . " telah ditambahkan!<br/>";
                        $i_sql->execute($array);
                    } 
                    else {
                        echo "[INFO] Post ID " . $data->id . " Sudah Ada! Akan Menimpa Data<br/>";
                        $u_sql->execute($array);
                    }
                }

                return $result;
            } 

        /*
            Stop Eksekusi Kode Jika Kondisi Tidak Terpenuhi
        */

            else {
                echo 'Oops! Terdapat Kesalahan. (HTTP Response ' . $info['http_code'] . ')';
                die();
            }
        // ---------------------------------------------------------------------------------
    }

}

    $blog    = new Blogger;
    $blog_id = array(
                    array('nama' => 'fajar',
                          'kode'  => 7002293545394669809, // kode blog
                    ),

                    array('nama' => 'octizen',
                          'kode'  => 1370402923878010255, // kode blog
                    )
                );
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>TKJ Jobsheet Checker - Fajar Ru</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>

        <p>
            Cek Postingan Jobsheet terbaru dari tiap Blog<br/>
            Aplikasi ini mencari Posting paling baru dari tiap blog dengan Tag <b>Jobsheet</b> (case-sensitive!)
        </p>

        <p>Blog Tersedia:</p>
            <form action='' method='get'>
                <select name="bloggerid">
                    <?php
                        foreach ($blog_id as $blogger_id){
                            print_r('<option value="' . $blogger_id['kode'] . '">' . $blogger_id['nama'] . '</option>');
                        }
                    ?>
                </select>
                <button type="submit" name="submit">Cari</button>
            </form>

        <?php
            
            if( isset($_GET['submit']) ){

                $get = $blog->getpost($_GET['bloggerid']);

                foreach ($get->items as $data){

                    echo '------------------------------------------- <br/>';
                    echo 'Judul Posting: <a href="'. $data->url . '">' . $data->title . '</a><br/>';
                    echo 'Penulis: ' . $data->author->displayName . '<br/>';
                    echo 'Diposkan: ' . str_replace('T', ' ', $data->published)  . '<br/>';
                    echo 'Tag: ' . $data->labels[0] . '<br/>';
                    echo '-------------------------------------------<br/>';
                }
            }
        ?>
    </body>
</html>
