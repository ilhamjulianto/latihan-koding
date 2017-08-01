<?php
/* -------------------------------------------------------------------
 Data Sampel
 ANGGAP DATA DARI DATABASE
*/
$_POST['user']       = 'fajar';
$_POST['email']      = 'kzofajar@gmail.com';
$_POST['fullname']   = 'Rohmad Fajarudin';
$_POST['kelas']      = 'XII-J/TKJ';
$_POST['uang_spp']   = '130000';

// Ini Array
$arraybayar          = array('jan' => 129388121,
                             'feb' => 232351252,
                             'mar' => 323124543,
                             'apr' => 412312364,
                             'mei' => 563174523,
                             'jun' => 601236123,
                             'jul' => 412333427,
                             'aug' => 862348111,
                             'sep' => null,
                             'okt' => null,
                             'nov' => null,
                             'des' => 912385685);

// ANGGAP CONTROLLER NYA
$hitunglunas    = count(array_filter($arraybayar)); // Ini Count & Filter
$uanglunas      = $_POST['uang_spp'] * $hitunglunas; // Operator Kali
$uangrp         = number_format($uanglunas, 0 , '', '.'); // Number Formatting
$startbulan     = 1;

// ANGGAP VIEW NYA
echo 'Nama Kamu: ' . $_POST['fullname'] . '<br/>';
echo 'Dari Kelas: ' . $_POST['kelas'] . '<br/><br/>';

echo 'Kamu udah bayar SPP dengan Total <b>Rp' . $uangrp . '</b> untuk <b>' . $hitunglunas . ' Bulan</b><br/>';
echo 'Detail Bayar: <br/>';

// Ini Looping
foreach($arraybayar as $sudahbayar){
    // Ini Conditional If/Else
    if ($sudahbayar !== NULL) {
        echo '---------------------------------------------------------------------<br/>';
        echo 'Bulan ke-' . $startbulan . ': <b>SAH gan!</b> [Kode Transaksi: ' . $sudahbayar . ']<br/>';
    } 
    else {
        echo '---------------------------------------------------------------------<br/>';
        echo 'Bulan ke-' . $startbulan . ': <b>Gek bayar jangan nunggak gan!</b> <br/>';
    }
    $startbulan++; // Tambah 1 Bulan Tiap Looping
}

echo "<br/><br/><br/> Yang dipake: <b>DOA, NIAT, Operator Aritmatik, (Asosiatif) Array, Looping, Conditional If/Else, Count,</b> &amp; Number Formatting (gak wajib)"
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Crosscheck SPP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
    
    </body>
</html>


