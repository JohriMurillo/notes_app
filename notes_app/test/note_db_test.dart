import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/service/database.dart';

void main() {
  group('NoteDB Tests', () {
    setUp(() async {
      // Aquí puedes realizar alguna configuración previa si es necesario.
      // Por ejemplo, eliminar todos los registros de la base de datos.
    });

    test('Insertar una nota debe retornar un ID', () async {
      final testNote = Note(title: 'Test Title', body: 'Test Body', date: DateTime.now());
      final id = await NoteDB.insert(testNote);
      expect(id, isNotNull); // Verifica que el ID retornado no sea nulo.
    });

    // Puedes agregar más pruebas para los métodos 'update', 'delete', y otros.
  });
}
