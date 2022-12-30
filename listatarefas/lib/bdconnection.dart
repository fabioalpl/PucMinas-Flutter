import 'package:listatarefas/tarefa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BDConnection {
  Database? _bd;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'tarefas.db';
    final origem = join(dbpath, dbname);

    //_bd = await openDatabase(origem, version: 1, onCreate: _criarBD);
    _bd =
        await openDatabase(origem, version: 1, onCreate: (db, dbVersaoRecente) {
      String sql = '''
          CREATE TABLE tarefa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
            finalizada INTEGER
      )
      ''';
      db.execute(sql);
    });
    return _bd!;
  }

  Future<int> criaTarefa(Tarefa tarefa) async {
    final bd = await database;
    return await bd.insert(
      'tarefa',
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletaTarefa(Tarefa tarefa) async {
    final db = await database;
    await db.delete('tarefa', where: 'id == ?');
  }

  Future<List<Tarefa>> listaTarefa() async {
    final bd = await database;
    List<Map<String, dynamic>> items =
        await bd.query('tarefa', orderBy: 'id DESC');

    return await List.generate(
      items.length,
      (i) => Tarefa(
        id: items[i]['id'],
        titulo: items[i]['titulo'],
        finalizada: items[i]['finalizada'] == 1 ? true : false,
      ),
    );
  }
}
