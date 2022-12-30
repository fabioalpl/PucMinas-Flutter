import 'package:flutter/material.dart';
import 'package:listatarefas/tarefa.dart';

import 'bdconnection.dart';
import 'listaTarefa.dart';

class ControllerTarefa extends StatefulWidget {
  //const ControllerTarefa({super.key});

  @override
  State<ControllerTarefa> createState() => _ControllerTarefaState();
}

class _ControllerTarefaState extends State<ControllerTarefa> {
  /*final List<Tarefa> tarefas = [
    Tarefa(id: 1, titulo: "Café", finalizada: true),
    Tarefa(id: 2, titulo: "Pão de Queijo", finalizada: false)
  ];*/

  late final List<Tarefa> tarefas = [];

  var _tituloController = TextEditingController();
  var controller = ControllerTarefa();
  var db = BDConnection();

  void criaTarefa(String titulo, bool check) async {
    final novaTarefa = Tarefa(titulo: titulo, finalizada: check);
    int id = await db.criaTarefa(novaTarefa);
    novaTarefa.id = id;
    setState(
      () {
        tarefas.add(novaTarefa);
      },
    );
  }

  void deletaTarefa(int id) async {
    await db.deletaTarefa(tarefas.firstWhere((tarefa) => tarefa.id == id));
    setState(
      () {
        tarefas.removeWhere((tarefa) => tarefa.id == id);
      },
    );
  }

  Future<void> populaListaTarefas() async {
    Future<List<Tarefa>> listFuture;
    List<Tarefa> list = [];

    list = await db.listaTarefa();
    setState(() {
      list.forEach((item) => tarefas.add(item));
    });
  }

  _showDialog() {
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
                Navigator.pop(context);
              },
              child: Text("Incluir"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    populaListaTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Lista de Compras'),
        ),
      ),
      body: ListaTarefa(
        tarefas: tarefas,
        deletaTarefa: deletaTarefa,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        tooltip: 'Nova Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
