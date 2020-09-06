import 'package:flutter/material.dart';
import 'package:moorTest/moor_database.dart';
import 'package:moorTest/router.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'moor_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppDatabaseNotifier(),
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        title: 'Material App',
        home: MyHomePage(
          title: "Moor Test",
        ),
      ),
    );
  }
}

class AppDatabaseNotifier extends ChangeNotifier {
  MyDatabase database;

  AppDatabaseNotifier() : database = MyDatabase();

  void reOpen() {
    database = MyDatabase();
    notifyListeners();
  }
}
