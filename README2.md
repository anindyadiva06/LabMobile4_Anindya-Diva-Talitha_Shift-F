Anindya Diva Talitha
H1D022026
SHIFT F

1. LOG IN
   ![image](https://github.com/user-attachments/assets/80677f54-3cfd-4b00-bf2d-bbf9953a54a8)

   Pengguna yang akunnya sudah terdaftar atau terdapat pada database dapat melakukan log in sesui dengn data yang didaftarkan pada saat registrasi.
   Apabila data yang dimasukkan sesuai maka pengguna akan redirect ke halaman utama yaitu list produk.

   ![image](https://github.com/user-attachments/assets/2348a442-4658-44d9-9088-3500fb0b16ed)

   Jika data yang dimasukkan tidak sesuai maka akan muncul pop-up warning yang memberitahukan bahwa login gagal dilakukan. Hal tersebut terjadi karena data username dan password
   belum terdaftar pada database sehingga login tidak bisa dilakukan.

2. REGISTRASI
  ![image](https://github.com/user-attachments/assets/0062e996-0be6-479d-abce-42ab04e97557)
  ![image](https://github.com/user-attachments/assets/3b075eb3-ea90-468d-93ec-648a60079cdb)

  Pengguna yang tidak/belum mempunyai akun maka akan melakukan registrasi. Pada registrasi terdapat formulir yang berisi nama, email, password, dan konfirmasi password. 
  Setelah mengisi formulir maka klik tombol 'Registrasi' dan akun telah ter-input ke database sehingga dapat melakukan log in dengan akun yang sudah dibuat tadi.
  data-data tersebut dikirim ke server dengan metode POST untuk disimpan. Apabila registrasi gagal maka akan muncul pop-up warning yang memberitahukan bahwa registrasi gagal.
  
  ![image](https://github.com/user-attachments/assets/d63e8e4e-8f56-475f-acb3-ada35e9171c9)
  ![image](https://github.com/user-attachments/assets/6b01e6c8-54aa-468d-b706-c1f12b714494)
  ![image](https://github.com/user-attachments/assets/fa167321-ccbb-4f85-920a-2d21a23f4479)
  ![image](https://github.com/user-attachments/assets/cfa15e73-2be3-4ec7-8a0b-ade69f0cfc91)

  Apabila pengisian email yang tidak valid, panjang password kurang dari 6 karakter, dan konfirmasi password tidak sesuai dengan password sebelumnya
  maka akan muncul pemberitahuan seperti pada gambar diatas.

3. LIST PRODUK
![image](https://github.com/user-attachments/assets/9bce62ca-56fe-4b25-9c83-4891f8f4db72)

Setelah login berhasil, pengguna akan diarahkan ke halaman utama yaitu halaman yang menampilkan list produk. Pada proses ini data ditampilkan dari list produk yang sudah ada 
pada database. Data diambil dengan metode GET kemudian ditampilkan pada UI 'produk_page.dart'. Pada file 'produk_bloc.dart' terdapat fungsi getProduks() yang akan mengambil daftar produk 
dari endpoint API yang ditentukan, menguraikan data JSON, dan mengubah setiap item dalam daftar menjadi objek Produk.

4. FORM PRODUK
  ![image](https://github.com/user-attachments/assets/4e95775c-6f00-49a4-bd8f-76d6847aebb0)
  
  Ketika icon '+' pada kanan atas di klik maka formulir 'Tambah Produk' akan muncul. Pada formulir terdapat kode produk, nama produk, dan harga produk yang harus diisi
  ketika ingin menambahkan list produk baru. Fungsi addProduk() mengirimkan permintaan POST ke API untuk menambahkan produk baru dengan menggunakan data produk yang dikirim sebagai parameter.
  Ketika informasi pada formulir sudah dilengkapi maka klik tombol simpan dan informasi produk yang baru dibuat
  akan muncul pada halaman list produk.

5. DETAIL PRODUK
  ![image](https://github.com/user-attachments/assets/641ecba5-6c71-4b8c-ba7a-c4acb22462e5)
  
  Untuk melihat detail suatu produk maka dapat klik salah satu produk. Pada halaman detail produk kita bisa melakukan 'Edit' dan 'Delete'
  terhadapap produk tersebut.

6. UBAH PRODUK
   ![image](https://github.com/user-attachments/assets/f55bf852-84d2-4cb9-aade-fa1ef37cb014)
   ![image](https://github.com/user-attachments/assets/5f149dde-389d-4555-b312-052244bd8f13)

    Untuk formulir edit produk berisi kode, produk, nama produk, dan harga produk. Apabila sudah melakukan perubahan terhadap informasi produk
   maka dapat klik 'Ubah' sehingga informasi produk akan berubah. Pada proses ini, fungsi updateProduk() mengirim permintaan PUT untuk memperbarui data produk yang ada
   berdasarkan id.
   
7. HAPUS PRODUK
   ![image](https://github.com/user-attachments/assets/254b3294-539c-4cf5-add8-828a6d187ff1)
   ![image](https://github.com/user-attachments/assets/f3007da2-c2c8-4ac9-b379-d5e9e5176bad)

   Ketika tombol 'Delete' di klik maka pop-up akan muncul. Pop-up tersebut berisi konfirmasi terkait penghapusan produk. Apabila meng-klik tombol 'Ya'
   maka data akan otomatis terhapus pada halaman list produk. Fungsi deleteProduk() mengirimkan permintaan DELETE untuk menghapus produk berdasarkan id yang diberikan.

8. LOG OUT
   ![image](https://github.com/user-attachments/assets/53583a18-a6d3-4d1a-887c-a93a5f424480)
   ![image](https://github.com/user-attachments/assets/b678b40d-fd37-4a61-b45c-8cfb9e60dbd8)

   Logout dapat dilakukan dengan meng-klik icon disamping tulisan logout. Pada proses ini session token dari aplikasi akan dihapus, sesi login saat ini akan diakhiri, serta pengguna akan diarahkan
   kembali ke halaman login.








