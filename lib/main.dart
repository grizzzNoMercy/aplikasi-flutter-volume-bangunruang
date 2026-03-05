import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volume Bangun Ruang',
      debugShowCheckedModeBanner: false,
      home: VolumePage(),
    );
  }
}

class VolumePage extends StatefulWidget {
  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {

  TextEditingController sisiController = TextEditingController();
  TextEditingController jariController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  double hasil = 0;

  void hitungKubus() {
    if (sisiController.text.isEmpty) return;

    double s = double.parse(sisiController.text);

    setState(() {
      hasil = s * s * s;
    });
  }

  void hitungTabung() {
    if (jariController.text.isEmpty || tinggiController.text.isEmpty) return;

    double r = double.parse(jariController.text);
    double t = double.parse(tinggiController.text);

    setState(() {
      hasil = 3.14 * r * r * t;
    });
  }

  void hitungKerucut() {
    if (jariController.text.isEmpty || tinggiController.text.isEmpty) return;

    double r = double.parse(jariController.text);
    double t = double.parse(tinggiController.text);

    setState(() {
      hasil = (1 / 3) * 3.14 * r * r * t;
    });
  }

  Widget inputField(TextEditingController controller, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  Widget tombol(String text, Function fungsi) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () => fungsi(),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Volume Bangun Ruang"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [

            Text("Kubus", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            inputField(sisiController, "Masukkan sisi"),
            tombol("Hitung Volume Kubus", hitungKubus),

            SizedBox(height: 20),

            Text("Tabung", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            inputField(jariController, "Masukkan jari-jari"),
            inputField(tinggiController, "Masukkan tinggi"),
            tombol("Hitung Volume Tabung", hitungTabung),

            SizedBox(height: 20),

            Text("Kerucut", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            inputField(jariController, "Masukkan jari-jari"),
            inputField(tinggiController, "Masukkan tinggi"),
            tombol("Hitung Volume Kerucut", hitungKerucut),

            SizedBox(height: 30),

            Text(
              "Hasil Volume = $hasil",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}