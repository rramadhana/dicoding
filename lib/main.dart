import 'package:flutter/material.dart';
import 'identitas.dart';
import 'login.dart';
import 'submenu.dart';
import 'tabung.dart';
import 'trapesium.dart';
import 'waktu.dart';
import 'menu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/menu': (context) => const Menu(),
      '/login': (context) => const Login(),
      '/submenu': (context) => const SubMenu(),
      '/tabung': (context) => const Tabung(),
      '/trapesium': (context) => const Trapesium(),
      '/profile': (context) => const profile(),
      '/waktu': (context) => const StopwatchPage(),
    },
    home: const Login(),
  ));
}
