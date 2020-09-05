import 'package:flutter/material.dart';
import 'package:moorTest/moor_database.dart';
import 'package:moorTest/router.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The single instance of AppDatabase
      create: (_) => MyDatabase(),

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
