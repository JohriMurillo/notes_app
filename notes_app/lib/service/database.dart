import 'package:notes_app/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDB {

// Instancia privada de la clase
  static final NoteDB _instance = NoteDB._();

  NoteDB._();

  // Método estático para obtener la instancia
  static NoteDB get instance => _instance;

  static Future <Database> _openDB()async{
    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, body TEXT, date DATETIME)"
         );
      },
      version: 1
      );
  }
static Future<int> insert(Note note) async {
    Database database = await _openDB();
    return await database.insert("notes", note.toMap());
  }
  
    delete (Note note) async{
    Database database = await _openDB();
    database.delete("notes", where: "id = ?", whereArgs: [note.id] );
       
  }
    updateNote (Note updateNote) async{
    Database database = await _openDB();
    database.update("notes", updateNote.toMap(), where: 'id = ?', whereArgs: [updateNote.id]);
  }
  static Future<List<Note>> getNotes() async {
  Database database = await _openDB();
  final List<Map<String, dynamic>> notesMap = await database.query("notes");
  return List.generate(notesMap.length, (i) => Note(
    id: notesMap[i]["id"],
    title: notesMap[i]["title"],
    body: notesMap[i]["body"],
    date: DateTime.parse(notesMap[i]["date"]),
      )
    );
  }
}