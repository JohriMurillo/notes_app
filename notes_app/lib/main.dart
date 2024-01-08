import 'package:flutter/material.dart';
import 'package:notes_app/model/theme.dart' as theme;
import 'package:notes_app/view/home_page.dart';
import 'package:notes_app/view_model/list_note_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ListNote>(create: (_) => ListNote())],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: theme.themeDark,
      home: const HomePage(),
    );
  }
}