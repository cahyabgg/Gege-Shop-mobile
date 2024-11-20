# gege_shop_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Tugas 7:


---

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

- **Stateless Widget** adalah widget yang tidak memiliki **state** atau kondisi yang bisa berubah selama siklus hidupnya. Stateless widget bersifat statis dan tidak dapat memperbarui tampilan setelah dirender pertama kali. Contoh dari stateless widget adalah `Text`, `Icon`, dan `Container`. Stateless widget hanya di-render sekali dan tidak memiliki fungsi `setState()`.

- **Stateful Widget** adalah widget yang memiliki **state** atau kondisi yang dapat berubah. Stateful widget bisa memperbarui tampilan (re-render) saat state atau kondisinya berubah, biasanya dengan memanggil fungsi `setState()`. Contoh dari stateful widget adalah `Checkbox`, `TextField`, dan `AnimatedContainer`. Stateful widget memiliki dua komponen utama: widget itu sendiri dan state-nya, yang dikelola oleh objek `State`.

- **Perbedaan utama**:
  - Stateless widget bersifat statis, sementara stateful widget dinamis.
  - Stateful widget memiliki state yang memungkinkan perubahan selama siklus hidupnya, sedangkan stateless widget tidak memiliki state.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Beberapa widget yang digunakan dalam proyek ini:

- **Scaffold**: Menyediakan struktur dasar untuk halaman, termasuk `AppBar`, `body`, dan `bottomNavigationBar`.
- **AppBar**: Menampilkan header atau judul di bagian atas halaman.
- **TabBar**: Menyediakan navigasi berbasis tab di bagian bawah halaman yang memungkinkan pengguna beralih antar tab.
- **TabBarView**: Menampilkan konten yang berbeda untuk setiap tab di dalam `TabBar`.
- **DefaultTabController**: Mengelola `TabBar` dan `TabBarView` tanpa perlu `TabController` manual.
- **Column**: Widget layout untuk menata anak-anaknya secara vertikal.
- **Row**: Widget layout untuk menata anak-anaknya secara horizontal.
- **Center**: Widget yang memusatkan anak-anaknya di tengah layar.
- **Container**: Widget dasar untuk styling, seperti padding, margin, warna, dan ukuran.
- **Padding**: Widget untuk memberikan ruang di sekitar widget anaknya.
- **Icon**: Widget untuk menampilkan ikon.
- **Text**: Menampilkan teks statis.
- **SnackBar**: Menampilkan pesan sementara di bagian bawah layar sebagai respon dari tindakan tertentu.
- **Card**: Widget untuk menampilkan konten dalam bentuk kartu dengan efek elevasi.

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

- **Fungsi `setState()`** digunakan dalam stateful widget untuk memberitahu Flutter bahwa ada perubahan pada state yang perlu di-re-render. Ketika `setState()` dipanggil, Flutter akan memicu proses rebuild pada widget yang memiliki perubahan, sehingga tampilan dapat diperbarui sesuai dengan state baru.
- Variabel yang bisa terdampak dengan `setState()` adalah **variabel yang ada dalam kelas `State`** dari widget tersebut. Biasanya, variabel ini adalah properti yang digunakan untuk menampung data atau kondisi yang berubah-ubah, seperti status tombol, input pengguna, atau data yang didapat dari API.

### 4. Jelaskan perbedaan antara const dengan final.

- **const**:
  - `const` digunakan untuk nilai yang bersifat **konstan pada waktu kompilasi** (compile-time constant). Artinya, nilai yang diinisialisasi harus sudah diketahui dan tetap saat kompilasi.
  - Nilai dari variabel `const` tidak bisa diubah dan selalu bersifat **immutable**.
  - `const` dapat digunakan untuk mendeklarasikan variabel dalam kelas atau sebagai modifier untuk widget yang tidak akan berubah selama siklus hidup aplikasi.

- **final**:
  - `final` digunakan untuk nilai yang diinisialisasi hanya sekali dan **tidak bisa diubah** setelah diinisialisasi, tetapi bisa diinisialisasi pada **waktu run-time**.
  - Nilai `final` dapat diisi dengan data dinamis yang baru diketahui saat aplikasi dijalankan.
  - `final` biasanya digunakan untuk variabel yang nilainya tetap setelah diinisialisasi namun nilainya belum diketahui saat kompilasi.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- Pertama saya mengetik ctrl-shift-p dan mengetik flutter create project dan membuat project flutter

- Saya menghapus MyHomePage di main.dart dan memindahkannya di file baru bernama menu.dart

- Saya merubah struktur MyHomePage di menu.dart agar menjadi stateless

- Saya memanggil MyHomePage di main.dart dalam bentuk stateless

- Saya merubah theme MyHomePage dengan color blue

- Saya merubah bentuk MyHomePage dengan menambahkan tab didapat dari website flutter dan dirubah layout serta warnanya

- Saya membuat agar tab tidak berefek ke infocard 

- Saya menambahkan listener di setiap tab agar memunculkan snackbar

- Saya menghapus button dan menggantinya icon setiap tab

--- 

### 1. **Kegunaan `const` dalam Flutter**
   Dalam Flutter, keyword `const` digunakan untuk mendeklarasikan nilai konstan pada suatu objek atau widget. Dengan menggunakan `const`, Flutter dapat mengoptimalkan kinerja aplikasi karena objek yang dideklarasikan sebagai konstan akan dibuat hanya sekali dan dapat digunakan kembali tanpa harus dibuat ulang setiap kali build ulang widget dilakukan.

   **Keuntungan menggunakan `const`:**
   - **Optimalisasi Memori:** `const` mencegah pembuatan objek berulang kali. Objek yang tidak berubah akan tetap sama di memori, sehingga menghemat memori dan meningkatkan kinerja.
   - **Meningkatkan Performa Rendering:** Dengan adanya `const`, widget yang tidak berubah tidak perlu dirender ulang ketika widget lainnya berubah.
   - **Debugging Lebih Mudah:** Dengan adanya `const`, kita dapat langsung mengidentifikasi widget mana yang seharusnya tidak mengalami perubahan, sehingga lebih mudah dalam melakukan debugging.

   **Kapan Menggunakan `const`:**
   - Ketika membuat widget atau variabel yang nilainya tetap dan tidak akan berubah selama runtime.
   - Ketika membuat UI statis atau objek yang hanya perlu dibuat sekali dan tidak perlu dimodifikasi.

   **Kapan Tidak Menggunakan `const`:**
   - Ketika nilai dari widget atau variabel akan berubah selama runtime.
   - Ketika membutuhkan data dinamis yang berasal dari user input atau dari jaringan (API).

### 2. **Perbandingan `Column` dan `Row` dalam Flutter**

   `Column` dan `Row` adalah widget layout dasar di Flutter yang digunakan untuk mengatur widget dalam orientasi vertikal dan horizontal.

   **Perbedaan Utama:**
   - **Column:** Mengatur widget secara vertikal (dari atas ke bawah).
   - **Row:** Mengatur widget secara horizontal (dari kiri ke kanan).

   **Contoh Implementasi:**
   ```dart
   // Contoh Column
   Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Text("Item 1"),
       Text("Item 2"),
       Text("Item 3"),
     ],
   );

   // Contoh Row
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: <Widget>[
       Icon(Icons.star),
       Icon(Icons.favorite),
       Icon(Icons.home),
     ],
   );
   ```

   **Kelebihan dan Kekurangan:**
   - **Column:** Cocok untuk tampilan yang memerlukan susunan vertikal, tetapi jika terlalu banyak widget akan muncul risiko `Overflow`.
   - **Row:** Cocok untuk tampilan horizontal, tetapi jika terlalu banyak item juga akan ada risiko `Overflow`.

### 3. **Elemen Input pada Form di Flutter**

   **Elemen Input yang Sering Digunakan:**
   - **TextFormField:** Untuk menerima input teks dari pengguna.
   - **DropdownButtonFormField:** Untuk pilihan dropdown.
   - **Checkbox:** Untuk pilihan boolean.
   - **Switch:** Alternatif untuk boolean, biasanya digunakan untuk opsi aktif/nonaktif.
   - **Radio:** Untuk pilihan yang terbatas di antara beberapa opsi.

   **Elemen Input Lain yang Tidak Digunakan:**
   - **Slider:** Digunakan untuk memilih nilai numerik dalam rentang tertentu.
   - **DatePicker:** Untuk memilih tanggal. Biasanya disertai tombol untuk membuka dialog kalender.
   - **TimePicker:** Untuk memilih waktu.

   Pemilihan elemen input tergantung pada jenis data yang dibutuhkan dalam form. Misalnya, jika hanya membutuhkan nilai numerik sederhana, maka `TextFormField` dengan tipe `keyboardType: TextInputType.number` sudah cukup tanpa perlu menambahkan `Slider`.

### 4. **Mengatur Tema dalam Aplikasi Flutter**

   Dalam Flutter, `ThemeData` digunakan untuk mendefinisikan tema global aplikasi. Dengan mendefinisikan tema, kita dapat memastikan konsistensi warna, font, dan style dalam seluruh aplikasi.

   **Langkah Mengimplementasikan Tema:**
   ```dart
   MaterialApp(
     theme: ThemeData(
       primaryColor: Colors.blue,
       accentColor: Colors.amber,
       textTheme: TextTheme(
         bodyText1: TextStyle(fontSize: 18.0, color: Colors.black),
         bodyText2: TextStyle(fontSize: 16.0, color: Colors.grey),
       ),
       buttonTheme: ButtonThemeData(
         buttonColor: Colors.blue,
         textTheme: ButtonTextTheme.primary,
       ),
     ),
     home: HomePage(),
   );
   ```

   Dengan menggunakan `ThemeData`, kita dapat mengontrol tampilan dari widget tanpa harus menetapkan style secara manual pada setiap widget, membuat tampilan aplikasi lebih seragam dan mudah diatur.

   **Pengimplementasian Tema pada Proyek:**
   Tema biasanya diimplementasikan pada aplikasi yang membutuhkan konsistensi tampilan di berbagai halaman. Tema membuat aplikasi lebih mudah dipelihara dan tampil lebih profesional.

### 5. **Menangani Navigasi dalam Aplikasi dengan Banyak Halaman di Flutter**

   Flutter memiliki beberapa cara untuk menangani navigasi antara halaman, yang paling umum adalah dengan menggunakan `Navigator` dan `MaterialPageRoute`.

   **Navigasi Dasar:**
   ```dart
   // Navigasi ke halaman lain
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => NewPage()),
   );

   // Kembali ke halaman sebelumnya
   Navigator.pop(context);
   ```

   **Navigasi dengan Named Routes:**
   ```dart
   // Definisikan Named Routes di MaterialApp
   MaterialApp(
     initialRoute: '/',
     routes: {
       '/': (context) => HomePage(),
       '/second': (context) => SecondPage(),
     },
   );

   // Panggil Named Routes
   Navigator.pushNamed(context, '/second');
   ```

   **Package `go_router`:** Package ini membantu memudahkan navigasi dan pengelolaan route terutama pada aplikasi yang kompleks dengan banyak halaman dan parameter di route.

   **Best Practice Navigasi:**
   - **Modularisasi:** Pisahkan halaman-halaman yang berbeda dalam file atau kelas terpisah untuk memudahkan pemeliharaan.
   - **Named Routes:** Lebih terorganisir untuk aplikasi dengan banyak halaman.
   - **Penggunaan `go_router` atau `AutoRoute`:** Jika aplikasi membutuhkan navigasi yang rumit atau mendukung deep linking, package ini sangat membantu dalam pengelolaan rute.

---


Tugas Individu 9
---
1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Memastikan Konsistensi Data
Model membantu memastikan bahwa data yang diterima dari atau dikirim ke API memiliki struktur dan tipe data yang sesuai. Dengan model, kita dapat dengan mudah memetakan atribut JSON ke atribut objek dalam aplikasi kita.

Mengurangi Risiko Error
Tanpa model, data yang diterima dari JSON biasanya diakses melalui tipe Map<String, dynamic>. Jika ada kesalahan pada struktur JSON (seperti nama atribut berubah, tipe data salah, atau atribut tidak ada), maka akan lebih sulit mendeteksi kesalahan atau menangani kasus tersebut.

Mempermudah Pemrosesan Data
Model memudahkan pengelolaan data, seperti:

Konversi JSON ke objek: ProductEntry.fromJson(json)
Konversi objek ke JSON: productEntry.toJson()
Mengelola data di UI atau logika aplikasi dengan struktur yang jelas.
Tanpa model, kita harus bekerja langsung dengan peta data (Map<String, dynamic>), yang membuat kode sulit dipahami dan rawan kesalahan.

Skalabilitas
Jika aplikasi bertumbuh, penggunaan model memastikan bahwa kode tetap terstruktur. Tanpa model, semakin banyak data JSON yang harus ditangani, semakin sulit menjaga konsistensi, dan kemungkinan error akan meningkat.

Apakah Akan Terjadi Error Jika Tidak Membuat Model?

Tidak selalu error, tetapi kode menjadi lebih sulit di-maintain. Misalnya:
Kamu bisa tetap membaca JSON dengan cara manual (json['key']).
Namun, ini membuat kode kurang aman dan rawan error saat runtime.
Kesalahan seperti berikut lebih mungkin terjadi:
Null Safety Issue: Ketika key tidak ada atau bernilai null.
Type Issue: Ketika tipe data dari JSON tidak sesuai.
2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Pada kode yang saya gunakan, fungsi library http dalah untuk melakukan komunikasi antara aplikasi Flutter dan backend (Django). Library ini memungkinkan aplikasi Flutter mengirimkan permintaan HTTP dan menerima respons dari server.

Fungsi fetchMood di list_productentry.dart
Mengambil data dari backend dalam format JSON menggunakan metode GET. Data JSON diterjemahkan menjadi objek Dart (ProductEntry) menggunakan metode fromJson. Fungsi ini membantu mengubah data yang diterima dari backend menjadi objek yang lebih mudah digunakan di aplikasi Flutter.

Fungsi login di login.dart
Mengautentikasi pengguna dengan mengirimkan username dan password ke endpoint login backend menggunakan metode POST. Endpoint login Django menerima data pengguna, memverifikasi kredensial, dan memberikan respons yang sesuai (misalnya, berhasil atau gagal).

Fungsi onPressed di product_entryform.dart
Mengirimkan data produk baru yang dimasukkan oleh pengguna ke backend menggunakan metode POST. Data yang dimasukkan pengguna diubah menjadi JSON menggunakan jsonEncode sebelum dikirim. URL endpoint Django menangani data dan menyimpannya ke database.

Fungsi onPressed di register.dart
Mendaftarkan pengguna baru dengan mengirimkan data pendaftaran (seperti username dan password) ke endpoint registrasi backend menggunakan metode POST. Data dikirim dalam format JSON ke endpoint Django yang memproses pendaftaran.

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Fungsi Utama CookieRequest:

CookieRequest secara otomatis menangani cookie yang diterima dari server (misalnya cookie sesi setelah login) dan menyertakannya dalam setiap permintaan HTTP berikutnya.Cookie ini memungkinkan backend mengenali pengguna yang sedang aktif tanpa perlu mengirim ulang token atau kredensial setiap kali ada permintaan.

Mempermudah penggunaan metode GET, POST, atau metode HTTP lainnya sambil memastikan cookie disertakan dalam header permintaan.

CookieRequest dapat digunakan untuk memeriksa apakah pengguna masih terautentikasi dengan memeriksa keberadaan atau validitas cookie sesi.

Dengan metode seperti postJson dan get, CookieRequest menyederhanakan pengiriman data JSON ke backend dan penerimaan respons dalam format yang sama.

Mengapa CookieRequest Perlu Dibagikan ke Semua Komponen Aplikasi Flutter?

Jika komponen berbeda di aplikasi (seperti halaman login, formulir entri, atau daftar produk) menggunakan instans CookieRequest yang sama, mereka akan berbagi cookie sesi yang sama. Hal ini memastikan backend dapat terus mengenali pengguna saat mereka berpindah halaman atau melakukan tindakan lain di aplikasi.

Membuat instans CookieRequest baru untuk setiap permintaan HTTP berarti cookie dan status sesi tidak akan dipertahankan, sehingga pengguna akan dianggap "baru" oleh server. Dengan berbagi instans, semua komponen bisa menggunakan cookie yang sama tanpa perlu otentikasi ulang.

Membagikan instans CookieRequest melalui seluruh aplikasi menyederhanakan kode karena semua komponen menggunakan alat yang sama untuk berkomunikasi dengan backend.

Setelah pengguna login dan cookie sesi tersimpan, halaman atau komponen lain dapat mengakses status login tersebut melalui instans CookieRequest.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Pengumpulan Data dari Input Pengguna
Pada Flutter, data yang dimasukkan pengguna melalui elemen input seperti TextField atau TextFormField ditangkap dan disimpan dalam variabel atau state. Fungsi onChanged mengambil data yang dimasukkan pengguna dan validator memvalidasi apakah data sudah sesuai format yang diinginkan.

Pengiriman Data ke Backend
Setelah data terkumpul, data dikirim ke backend menggunakan pustaka seperti http atau CookieRequest dalam bentuk HTTP Request. Data dikirim dalam format tertentu seperti JSON, sesuai kebutuhan API. Fungsi postJson mengirim data dalam format JSON melalui metode HTTP POST ke endpoint API backend dan jsonEncodem engubah data menjadi format JSON agar kompatibel dengan API.

Pemrosesan Data di Backend
Backend menerima request dari Flutter.
Backend memvalidasi data yang diterima.
Jika valid, data disimpan dalam database atau diproses sesuai kebutuhan.
Backend mengirimkan respons ke Flutter, yang biasanya berisi status pengiriman atau data yang telah diolah.
Penerimaan Respons di Flutter
Flutter menerima respons dari backend, lalu respons tersebut di-decode menjadi objek atau model untuk diproses lebih lanjut. Fungsi response menyimpan data hasil respons dari backenddan setState memperbarui UI berdasarkan hasil respons.

Menampilkan Data di UI Flutter
Data yang diterima dari backend (misalnya hasil respons atau data baru dari API) ditampilkan kembali ke pengguna melalui widget, seperti Text, ListView, atau DataTable

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Register (Pendaftaran Akun Baru)
Input Data di Flutter:

Pengguna mengisi data akun melalui form input (misalnya TextFormField).
Data seperti username, password, dan confirm_password dikirimkan ke endpoint Django menggunakan HTTP POST.
Proses di Django:

Django menerima data pendaftaran melalui endpoint /auth/register/.
Backend memvalidasi:
Apakah username sudah ada?
Apakah password dan confirm_password cocok?
Jika validasi berhasil:
Django menyimpan data pengguna ke database (misalnya, menggunakan model User dari Django's Authentication Framework).
Django mengembalikan respons JSON
Jika terjadi kesalahan, Django mengembalikan respons dengan pesan error.
Respons di Flutter:

Flutter menerima respons dari Django.
Jika berhasil, pengguna diberi notifikasi sukses dan diarahkan ke halaman login.
2. Login (Autentikasi Pengguna)
Input Data di Flutter:

Pengguna memasukkan username dan password pada form login.
Data dikirimkan ke endpoint Django /auth/login/ menggunakan HTTP POST.
Proses di Django:

Django menerima data login dan memvalidasi:
Apakah username ada di database?
Apakah password sesuai dengan hashed password yang disimpan?
Jika validasi berhasil:
Django membuat sesi (session) atau token autentikasi (misalnya, JSON Web Token atau session cookie).
Django mengembalikan respons JSON dengan status berhasil dan informasi sesi/token.
Jika validasi gagal, Django mengembalikan pesan error.
Penyimpanan Token di Flutter:

Flutter menerima respons dari Django.
Token disimpan secara lokal di perangkat pengguna, misalnya menggunakan SharedPreferences atau secure_storage.
Jika login berhasil, pengguna diarahkan ke halaman menu utama.
3. Mengakses Menu Setelah Login
Token Validasi:

Flutter menggunakan token yang disimpan untuk mengakses data dari API Django.
Setiap permintaan HTTP ke Django disertai dengan token autentikasi di header.
Proses di Django:

Django memvalidasi token yang diterima dari permintaan HTTP.
Jika token valid, Django memberikan data yang diminta (misalnya, daftar produk atau profil pengguna).
Jika token tidak valid, Django mengembalikan pesan error dengan status tidak terautentikasi.
Penerapan di Flutter:

Jika respons valid, data ditampilkan kepada pengguna.
Jika tidak valid, pengguna diarahkan kembali ke halaman login.
4. Logout (Mengakhiri Sesi)
Proses di Flutter:

Flutter mengirim permintaan HTTP ke endpoint Django /auth/logout/ menggunakan HTTP POST atau DELETE.
Token atau sesi dihapus dari Django.
Token lokal di Flutter juga dihapus, biasanya menggunakan SharedPreferences atau secure_storage.
Proses di Django:

Django menerima permintaan logout.
Django menghapus sesi/token yang terkait dengan pengguna.
Django mengembalikan respons JSON
Penyelesaian di Flutter:

Token dihapus dari perangkat pengguna.
Pengguna diarahkan kembali ke halaman login.
---