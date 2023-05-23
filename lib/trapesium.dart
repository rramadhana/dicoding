import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class Trapesium extends StatefulWidget {
  const Trapesium({super.key});

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  TextEditingController tinggi = TextEditingController();
  TextEditingController sisiatas = TextEditingController();
  TextEditingController sisibawah = TextEditingController();
  num? phitagoras;
  num? keliling;
  num? luas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trapesium"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sisi atas',
                ),
                controller: sisiatas),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sisi bawah',
                ),
                controller: sisibawah),
            const SizedBox(
              height: 30.0,
            ),
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  setState(() {
                    num selisih =
                        (num.parse(sisibawah.text) - num.parse(sisiatas.text)) / 2;
                    phitagoras = sqrt(selisih * selisih +
                        num.parse(tinggi.text) * num.parse(tinggi.text));
                    keliling = 2 * phitagoras! +
                        num.parse(sisibawah.text) +
                        num.parse(sisiatas.text);
                    luas =
                        (num.parse(sisiatas.text) + num.parse(sisibawah.text)) *
                            num.parse(tinggi.text) /
                            2;
                  });
                },
                child: const Text("Hitung")),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Luas Trapesium:  ${luas == null ? '' : luas.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Keliling Trapesium:  ${keliling == null ? '' : keliling.toString()}",
              style: const TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}