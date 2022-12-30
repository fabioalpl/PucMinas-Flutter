import 'package:flutter/material.dart';
import 'package:listatarefas/tarefa.dart';

import 'bdconnection.dart';
import 'listaTarefa.dart';

class ControllerTarefa extends StatefulWidget {
  //const ControllerTarefa({super.key});

  @override
  State<ControllerTarefa> createState() => _ControllerTarefaState();

  void criaTarefa(String text, bool bool) {}
}

class _ControllerTarefaState extends State<ControllerTarefa> {
  final List<Tarefa> tarefas = [
    Tarefa(id: 1, titulo: "Café", finalizada: true),
    Tarefa(id: 2, titulo: "Pão de Queijo", finalizada: false)
  ];

  var _tituloController = TextEditingController();
  var controller = ControllerTarefa();
  var db = BDConnection();

  void criaTarefa(String titulo, bool check) async {
    final novaTarefa = Tarefa(titulo: titulo, finalizada: check);
    await db.criaTarefa(novaTarefa);
    setState(
      () {
        tarefas.add(novaTarefa);
      },
    );
  }

  void deletaTarefa(String id) async {
    //await db.deletaTarefa(tarefa);
    setState(
      () {
        tarefas.removeWhere((tarefa) => tarefa.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Lista de Compras'),
        ),
      ),
      body: ListaTarefa(tarefas),
      //CardTarefa(criaTarefa),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Incluir Tarefa'),
                content: TextField(
                  controller: _tituloController,
                  decoration: InputDecoration(hintText: "Título"),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      criaTarefa(_tituloController.text, false);
                    },
                    child: Text("Incluir"),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Nova Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
