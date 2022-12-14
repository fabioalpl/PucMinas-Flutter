import 'package:flutter/material.dart';

class CadGastos extends StatelessWidget {
  //const CadGastos({super.key});
  final Function addGastos;
  CadGastos(this.addGastos);

  var descritivoController = TextEditingController();
  var valorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      padding: EdgeInsets.all(3),
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Descrição de Gastos"),
            keyboardType: TextInputType.text,
            controller: descritivoController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Valor"),
            keyboardType: TextInputType.number,
            controller: valorController,
            onSubmitted: (value) {
              addGastos(descritivoController.text,
                  double.parse(valorController.text));
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                addGastos(descritivoController.text,
                    double.parse(valorController.text));
              },
              child: Text("Incluir"),
            ),
          ),
        ]),
      ),
    );
  }
}
