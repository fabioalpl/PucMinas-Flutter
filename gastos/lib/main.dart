import 'package:flutter/material.dart';
import 'controlaGasto.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle de gastos!"),
      ),
      body: Column(
        children: [
          ControllerGastos(),
        ],
      ),
      //bottomNavigationBar: Text("Total: R\$ 5,00"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Total: R\$ 5,00")],
          ),
        ),
      ),
    );
  }
}
