import 'package:flutter/material.dart';
import 'package:flutter_parsing_data/views/halaman_utama.dart';

void main() {
  runApp(new MaterialApp(
    title: "My App",
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MY App', home: HalamanUtama());
  }
}
