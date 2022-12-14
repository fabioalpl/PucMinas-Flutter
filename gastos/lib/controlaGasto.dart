import 'package:flutter/cupertino.dart';

import 'cardGastos.dart';
import 'gasto.dart';
import 'listaGastos.dart';

class ControllerGastos extends StatefulWidget {
  const ControllerGastos({super.key});

  @override
  State<ControllerGastos> createState() => _ControllerGastosState();
}

class _ControllerGastosState extends State<ControllerGastos> {
  final List<Gasto> extrato = [
    Gasto('G1', "Café", 2.00, DateTime.now()),
    Gasto('G2', "Pão de Queijo", 3.00, DateTime.now())
  ];
  addGastos(String descritivo, double valor) {
    final newGastos =
        Gasto(DateTime.now().toString(), descritivo, valor, DateTime.now());
    setState(() {
      extrato.add(newGastos);
    });
  }

  deleteGasto(String id) {
    setState(() {
      extrato.removeWhere((gasto) => gasto.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CadGastos(addGastos),
        ListaGastos(extrato, deleteGasto),
      ],
    );
  }
}
