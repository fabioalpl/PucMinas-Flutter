import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  calcula() {
    setState(() {
      double _qtd = double.parse(qtd.text);
      double _valor = double.parse(valor.text);
      resposta = _valor / _qtd;
    });
    if (resposta < 17) {}
  }

  double resposta = 0;
  TextEditingController qtd = TextEditingController();
  TextEditingController valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Divide a Conta")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Quantidade de pessoas: "),
            keyboardType: TextInputType.number,
            controller: qtd,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Valor da conta: "),
            keyboardType: TextInputType.number,
            controller: valor,
          ),
          ElevatedButton(onPressed: calcula, child: Text("Calcular")),
          Text(resposta.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
