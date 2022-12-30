import 'package:flutter/material.dart';

class CardTarefa extends StatelessWidget {
  //const CardTarefa({super.key});

  final Function criaTarefa;
  CardTarefa(this.criaTarefa);
  var tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.blue,
        /*
      width: double.infinity,
      padding: EdgeInsets.all(3),*/
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Título da tarefa"),
            keyboardType: TextInputType.text,
            controller: tituloController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                criaTarefa(tituloController.text);
              },
              child: Text("Incluir Tarefa"),
            ),
          ),
        ]),
      ),
    );
  }
}
