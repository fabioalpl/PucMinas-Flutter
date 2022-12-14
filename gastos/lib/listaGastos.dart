import 'package:flutter/material.dart';
import 'package:gastos/gasto.dart';
import 'package:intl/intl.dart';

class ListaGastos extends StatelessWidget {
  //const ListaGastos({super.key});
  final List<Gasto> extrato;
  final Function deleteGasto;
  ListaGastos(this.extrato, this.deleteGasto);
  double Total() {
    for (var gasto in extrato) {
      total += gasto.valor;
    }
    return total;
  }

  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        //padding: EdgeInsets.all(5),
        //child: Column(
        children: extrato.map((gasto) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: Colors.purple.shade300)),
                  child: Text(
                    "R\$ " + gasto.valor.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple[300]),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      gasto.titulo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    //Text(gasto.data.toString())
                    Text(
                      DateFormat('dd-MM-yyyy HH:mm').format(gasto.data),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    deleteGasto(gasto.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
    //Text("Total: R\$"Total().toString())
  }
}
