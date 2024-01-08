import 'package:flutter/material.dart';
import 'package:notes_app/model/theme.dart';
import 'package:notes_app/view_model/list_note_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/model/note.dart';

class DetalleNota extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _cuerpoController = TextEditingController();
  final Note? existingNote;

  DetalleNota({super.key, this.existingNote}) {
    if (existingNote != null) {
      _tituloController.text = existingNote!.title;
      _cuerpoController.text = existingNote!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double tLetra = 18;
    const double letraTitulo = 22;
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
        color: themeDark.canvasColor,),onPressed: (){
          Navigator.pop(context);
        },),
        actions: [
          IconButton(
            icon:  Icon(Icons.done,
            color: themeDark.canvasColor,),
            onPressed: (){
              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                Note nota;
                if (existingNote == null) {
                  nota = Note(
                    title: _tituloController.text,
                    body: _cuerpoController.text,
                    date: DateTime.now(),
                  );
                  context.read<ListNote>().addNota(nota);
                } else {
                  nota = existingNote!.copyWith(
                    title: _tituloController.text,
                    body: _cuerpoController.text,
                    date: DateTime.now(),
                  );
                  context.read<ListNote>().updateNota(nota);
                }
                Navigator.pop(context);
              }
            },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo_pantalla.jpg'),
          fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  child: TextFormField(
                    controller: _tituloController,
                    style: const TextStyle(fontSize: letraTitulo),
                    maxLength: 50,
                    decoration: InputDecoration(
                       hintText: _tituloController.text.isEmpty ? 'Titulo' : '',
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _cuerpoController,
                  style: const TextStyle(fontSize: tLetra),
                  maxLines: null,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    hintText: _cuerpoController.text.isEmpty ? 'Cuerpo' : '',
                    labelStyle: const TextStyle(fontSize: tLetra),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese al menos un carácter';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
