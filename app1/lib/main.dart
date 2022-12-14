import 'package:app1/aula2.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(const MyApp());
  runApp(const MaterialApp(home: MyWidget2()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  calcula() {
    setState(() {
      double _peso = double.parse(peso.text);
      double _altura = double.parse(altura.text);
      resposta = _peso / (_altura * _altura);
    });
    if (resposta < 17) {}
  }

  double resposta = 0;
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cálculo do IMC"),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Peso"),
              keyboardType: TextInputType.number,
              controller: peso,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Altura em cm"),
              keyboardType: TextInputType.number,
              controller: altura,
            ),
            ElevatedButton(onPressed: calcula, child: Text("Calcular")),
            Text(resposta.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}
