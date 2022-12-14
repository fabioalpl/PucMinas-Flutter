import 'package:flutter/material.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  bool selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text("Aceitar termos do site!"),
            subtitle: Text("Para continuar marque a opção"),
            value: selecionado,
            onChanged: (valor) {
              setState(() {
                selecionado = valor ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Aceitar termos do site!"),
            subtitle: Text("Para continuar marque a opção"),
            value: selecionado,
            onChanged: (valor) {
              setState(() {
                selecionado = valor ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}

/*Column(
          children: [
            Text("Aceita os termos do site"),
            Checkbox(
                value: selecionado,
                onChanged: (valor) {
                  setState(() {
                    //Se vier nulo usar false
                    selecionado = valor ?? false;
                  });
                  print(valor.toString());
                })
          ],
        ),*/