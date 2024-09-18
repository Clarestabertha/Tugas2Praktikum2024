# Penjelasan Pertemuan 2 
Nama : Claresta Berthalita Jatmika
NIM : H1D022050
Shift Baru : F

## Deskripsi Aplikasi
Aplikasi ini adalah aplikasi flutter sederhana yang memungkinkan pengguna untuk menginput data mahasiswa berupa nama, NIM, dan tahun lahir lalu sistem akan menampilkan data yang sudah diinputkan pada halaman lain. 

## Hasil Fork dan Clone

1. Fork repository github asprak ke dalam github sendiri

2. Jika sudah berhasil, buka CMD dan jalankan perintah clone

3. Jika file sudah berada pada direktori yang kita pilih selanjutnya jalankan
```
flutter pub get
```

4. Untuk menjalankan aplikasi dengan
```
flutter run
```

## Struktur Proyek
- 'main.dart' : file yang berisi titik saat memulai aplikasi
- 'ui/'
    -'form_data.dart' : file yang berisi sebuah form yang harus diisi oleh pengguna
    -'tampil_data.dart' : file yang berisi untuk menampilkan inputan dari pengguna pada form_data sebelumnya

## Penjelasan Alur Aplikasi
### 1. **Mengumpulkan data pengguna dengan formulir**
Saat aplikasi dijalankan sistem akan menampilkan halaman awal yang berisi formulir yang akan diisi oleh pengguna. Formulir tersebut berisi :
Nama : ....
NIM : ....
Tahun : ....

Input dari formulir tersebut, menggunakan 'TextEditingController' dan selanjutnya akan disimpan dalam variable controller yaitu : 
```dart
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunController = TextEditingController();
```

### 2. **Tombol Simpan**
Setelah semua inputan yang ada pada 'TextField' sudah diisi, selanjutnya pengguna akan menyimpan hasil inputan dengan menekan tombol 'SIMPAN' dan akan menuju ke halaman berikutnya.
```dart
 _tombolSimpan() {
    return SizedBox(
      width: double.infinity, // Membuat tombol selebar layar
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: const Color.fromARGB(255, 81, 178, 223),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun)));
        },
        child: const Text(
          'Simpan',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
```
Dari kode diatas, saat tombol simpan di klik pertama kali ('OnPressed') akan mengambil value yang berada di '_namaController' dan '_nimController' lalu diubah menjadi 'String' dan mengambil value dari variabel controller '_tahunController' dan diubah menjadi 'int'. Selanjutnya pada kode 'Navigator.of(context).push()' akan membuat sistem menuju ke halaman lain pada saat tombol simpan di klik.

### 3. **Menampilkan hasil Input pada halaman tampil_data**
'TampilData' merupakan 'StatelessWidget' yang menerima hasil inputan pada 'FormData' (Nama, Nim, Tahun). Data yang ditampilkan pada halaman ini, diterima melalui konstruktor sebagai parameter dan disimpan dalam variabel nama, nim, dan tahun
```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);
```

### 4. **Menghitung usia**
Umur mahasiswa akan dihitung dengan rumus 'DateTime.now().year - tahun;' dan menghasilkan umur berdasarkan hasil input tahun pada formulir sebelumnya.

### 5. **Tombol Kembali**
Apabila di klik maka sistem akan menampilkan halaman sebelumnya yaitu, halaman formulir. dengan menggunakan kode 'Navigator.pop(context);'.

## Screen Record Hasil
![Screen record hasil](tugas_2.webm)

