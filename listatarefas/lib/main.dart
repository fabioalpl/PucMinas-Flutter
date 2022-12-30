import 'package:flutter/material.dart';

import 'controllerTarefa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerTarefa();
  }
}
