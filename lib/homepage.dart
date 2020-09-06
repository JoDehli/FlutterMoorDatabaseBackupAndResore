import 'package:flutter/material.dart';
import 'package:moorTest/moor_database.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dbNotifier = Provider.of<AppDatabaseNotifier>(context);
    final database = dbNotifier.database;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        widget.title + ": " + snapshot.data.length.toString());
                  } else {
                    return Text(widget.title + ": ");
                  }
                },
                stream: database.watchEnties()),
            Spacer(),
            Container(
                width: 60,
                child: MaterialButton(
                  color: Theme.of(context).backgroundColor,
                  onPressed: () {
                    database.deleteAll();
                  },
                  child: Icon(
                    Icons.clear_all,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
                )),
            SizedBox(width: 5),
            Container(
                width: 60,
                child: MaterialButton(
                  color: Theme.of(context).backgroundColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/backup');
                  },
                  child: Icon(
                    Icons.backup,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
                ))
          ],
        ),
      ),
      body: Center(
        child: StreamBuilder(
            stream: database.watchEnties(),
            builder: (context, AsyncSnapshot<List<Zaehler>> snapshot) {
              final counters = snapshot.data ?? List();
              return ListView.builder(
                  shrinkWrap: false,
                  itemCount: counters.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 8,
                        child: SizedBox(
                          height: 50,
                          child: Text(
                            "${counters[index].value}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var rng = new Random();
          database.insertEntry(Zaehler(id: null, value: rng.nextInt(1000)));
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
