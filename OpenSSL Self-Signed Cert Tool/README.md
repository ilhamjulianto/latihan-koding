## OpenSSL Self-Signed Certificate Tool (26/07/2017)
Ini adalah Script Bash sederhana untuk membantu membuat Sertifikat SSL Self-Signed untuk Website. Semua perintah dan urutan kerja yang ada di Script ini sama persis dengan yang ada di salah satu [Postingan Blog](https://penguinstunnel.blogspot.co.id/2017/01/membuat-self-signed-ca-ssl-dengan.html "Penguin's Tunnel") saya. Jadi Script ini merupakan "Wrapper" dari semua perintah yang ada di blog untuk mempermudah pembuatan.

### Fitur
* Dapat Membuatkan Struktur Direktori Beserta Konfigurasinya Secara Otomatis
* Pembuatan 3 Level Sertifikat (Root, Intermediate, Web Certificate)

### Penggunaan
Script ini (seharusnya) dapat dijalankan di semua Distro Linux / Unix. Pastikan paket `openssl` sudah terinstall untuk dapat mulai menggunakan.