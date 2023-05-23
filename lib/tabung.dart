import 'package:flutter/material.dart';
import 'dart:math';

class Tabung extends StatefulWidget {
  const Tabung({Key? key}) : super(key: key);

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  TextEditingController tinggi = TextEditingController();
  TextEditingController jarijari = TextEditingController();
  num pi = 3.14;
  num? Keliling;
  num? Luas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabung"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tinggi',
                ),
                controller: tinggi),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Jari-jari',
                ),
                controller: jarijari),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                setState(() {
                  Keliling = 2 * pi * num.parse(jarijari.text);
                  Luas =
                      pi * num.parse(jarijari.text) * num.parse(jarijari.text) +
                          2 *
                              pi *
                              num.parse(jarijari.text) *
                              num.parse(tinggi.text);
                });
              },
              child: const Text("Hitung"),
            ),
            SizedBox(height: 20.0,
            ),

            Text(
              "luas Tabung  :  ${Luas == null ? '' : Luas.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Keliling Tabung :  ${Keliling == null ? '' : Keliling.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
