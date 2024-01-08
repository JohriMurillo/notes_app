import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/service/database.dart';

class ListNote extends ChangeNotifier {
  final NoteDB _noteDB = NoteDB.instance;

  List<Note> _notas = [];

  List<Note> get notas => _notas;
   ListNote() {
    getNotas();
  }

 void addNota(Note nota) async {
  final id = await NoteDB.insert(nota.copyWith(date: DateTime.now()));
  Note notaConId = nota.copyWith(id: id);
  _notas.add(notaConId);
  notifyListeners();
}

  void deleteNota (Note nota) async{
    _notas.removeWhere((n) => n.id == nota.id);
    _noteDB.delete(nota);
    notifyListeners();
  }

updateNota(Note nota) async {
  final index = _notas.indexWhere((n) => n.id == nota.id);
  if (index != -1) {
    _notas[index] = nota;
    _noteDB.updateNote(nota);
    notifyListeners();
  }
}

Future<void> getNotas()async{
  _notas = await NoteDB.getNotes();
  notifyListeners();
}

 final List<Note> _selectedNotes = [];

  List<Note> get selectedNotes => _selectedNotes;

  void selectNota(Note nota) {
    _selectedNotes.add(nota);
    notifyListeners();
  }

  void deselectNota(Note nota) {
    _selectedNotes.remove(nota);
    notifyListeners();
  }

  void clearSelection() {
    _selectedNotes.clear();
    notifyListeners();
  }
}
  
