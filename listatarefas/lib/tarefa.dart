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
    var map = <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'finalizada': finalizada ? 1 : 0,
    };

    if (id != null) map['id'] = id;

    return map;
  }
}
