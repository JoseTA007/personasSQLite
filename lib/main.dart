import 'package:flutter/material.dart';
import 'editar.dart';
import 'listado.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MiApp(),
    );
  }
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (context) => Listado(), "/editar": (context) => Editar()},
    );
  }
}
