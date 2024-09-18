import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perkenalan"),
        backgroundColor: const Color.fromARGB(255, 81, 178, 223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data Mahasiswa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildDataRow('Nama:', nama),
            const SizedBox(height: 15),
            _buildDataRow('NIM:', nim),
            const SizedBox(height: 15),
            _buildDataRow('Umur:', '$umur tahun'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  backgroundColor: const Color.fromARGB(255, 81, 178, 223),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman form
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
