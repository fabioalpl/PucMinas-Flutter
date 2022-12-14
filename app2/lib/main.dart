import 'package:app2/aula2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp2()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  TextStyle formataTexto() {
    return TextStyle(
        fontSize: 20,
        color: Colors.indigo,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 10,
        wordSpacing: 20,
        decoration: TextDecoration.underline,
        decorationColor: Colors.amber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.greenAccent)),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Texto 1",
              style: formataTexto(),
            ),
            Text(
              "Texto 2",
              style: formataTexto(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Incluir"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Cancelar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
