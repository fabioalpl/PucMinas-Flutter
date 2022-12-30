import 'package:flutter/material.dart';
import 'package:listatarefas/tarefa.dart';

class ListaTarefa extends StatefulWidget {
  const ListaTarefa({
    super.key,
    required this.deletaTarefa,
    required this.tarefas,
  });

  final Function deletaTarefa;
  final List<Tarefa> tarefas;

  @override
  State<ListaTarefa> createState() =>
      _ListaTarefaState(this.tarefas, this.deletaTarefa);
}

class _ListaTarefaState extends State<ListaTarefa> {
  _ListaTarefaState(this.tarefas, this.deletaTarefa);

  final Function deletaTarefa;
  final List<Tarefa> tarefas;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        padding: EdgeInsets.all(5),
        children: tarefas.map(
          (tarefa) {
            return Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Checkbox(
                            value: tarefa.finalizada,
                            onChanged: (bool? value) {
                              setState(() {
                                tarefa.finalizada = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Text(
                              tarefa.titulo.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple[300]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        deletaTarefa(tarefa.id);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ]),
            );
          },
        ).toList(),
      ),
    );
  }
}
