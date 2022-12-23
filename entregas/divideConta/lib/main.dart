import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
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
      double _porcentagem = double.parse(porcentagem.text);
      double _valor = double.parse(valor.text);

      percentual = _porcentagem / 100.0;

      resposta = _valor / _qtd;
      totalGarcon = percentual * _valor;
      total = _valor + totalGarcon;
    });
  }

  double resposta = 0;
  double total = 0;
  double totalGarcon = 0;
  double percentual = 0;
  TextEditingController qtd = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController porcentagem = TextEditingController();

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
            decoration: InputDecoration(labelText: "Porcentagem ao garçon: "),
            keyboardType: TextInputType.number,
            controller: porcentagem,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Valor da conta: "),
            keyboardType: TextInputType.number,
            controller: valor,
          ),
          ElevatedButton(onPressed: calcula, child: Text("Calcular")),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: R\$ " + total.toString()),
              Text("Para cada um: R\$ " + resposta.toString()),
              Text("Porcentagem Garçon: R\$ " + totalGarcon.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
