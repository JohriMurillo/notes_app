import 'package:flutter/material.dart';
import 'package:notes_app/model/theme.dart';
import 'package:notes_app/view/detalle_nota.dart';
import 'package:notes_app/view/note_card.dart';
import 'package:notes_app/view_model/list_note_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var notas = context.watch<ListNote>();
    var reversedNotas = notas.notas.reversed.toList();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Mis notas',
      style: TextStyle(color: Color.fromARGB(255, 21, 70, 70),
      fontSize: 24,
      fontWeight: FontWeight.bold,)),
        actions: [
          if (notas.selectedNotes.isNotEmpty)
  IconButton(
    icon: Icon(Icons.delete,
    color: themeDark.canvasColor,),
    onPressed: () {
      for (var nota in notas.selectedNotes) {
        notas.deleteNota(nota);
      }
      notas.clearSelection();
    },
  ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetalleNota()),
              );
            },
            icon:  Icon(Icons.add, 
            color: themeDark.canvasColor,),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo_pantalla.jpg'),
          fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: reversedNotas.length,
              itemBuilder: (context, index){
                var nota = reversedNotas[index];
              
                 return GestureDetector(onLongPress: () {
                   if (notas.selectedNotes.contains(nota)) {
                    notas.deselectNota(nota);
                   }else{
                    notas.selectNota(nota);
                   }
                 },
                  onTap: () {
                   Navigator.push(context, 
                   MaterialPageRoute(
                    builder: (context)=> DetalleNota(existingNote: nota)),);
                 },
                   child: NoteCard(
                    title: nota.title,
                    cuerpo: nota.body,
                    dateTime: nota.date,
                    isSelected: false,
                               ),
                
                 );
               },
                   staggeredTileBuilder: (int index) =>
                  const StaggeredTile.fit(1),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 12.0,
            ),
            
          )
        ),
      )
    );
  }
}
