class Tarefa {
  int? id;
  final String titulo;
  bool finalizada;

  Tarefa({
    this.id,
    required this.titulo,
    required this.finalizada,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'finalizada': finalizada ? 1 : 0,
    };
  }
}
