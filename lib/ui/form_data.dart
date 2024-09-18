import 'package:flutter/material.dart';
import '/ui/tampil_data.dart'; // Sesuaikan dengan struktur file yang ada

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data Mahasiswa"),
        backgroundColor: const Color.fromARGB(255, 81, 178, 223),
      ),
      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Masukkan Data Mahasiswa",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _textboxNama(),
        const SizedBox(height: 15),
        _textboxNIM(),
        const SizedBox(height: 15),
        _textboxTahun(),
        const SizedBox(height: 30),
        _tombolSimpan(),
      ],
    ),
  ),
),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Mahasiswa",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.person),
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM Mahasiswa",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.badge),
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.calendar_today),
      ),
      controller: _tahunController,
      keyboardType: TextInputType.number,
    );
  }

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
}
