import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatefulWidget {
  
  final String title;
  final String cuerpo;
  final DateTime dateTime;
  final bool isSelected;

  const NoteCard({Key? key,required this.title, required this.cuerpo, required this.dateTime,required this.isSelected}) 
  : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    
    return   
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child:  Card(
                  child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title),
                      const SizedBox(height: 8.0),
                      Text(widget.cuerpo,
                           maxLines: 5,
                           overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 15.0),
                       Text(
                          DateFormat.yMMMd().format(widget.dateTime),
                          style: const TextStyle(fontSize: 14.0),
                      ),
                          ],
                        ),
                )
                    ),
              );
    
  }
}