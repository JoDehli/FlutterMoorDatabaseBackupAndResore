//import 'package:moor_flutter/moor_flutter.dart';

import 'package:flutter/foundation.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
part 'moor_database.g.dart';

/* 
 Commands:
  - flutter packages pub run build_runner watch
*/
@DataClassName("Zaehler")
class ZaehlerEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get value => integer().withDefault(const Constant(0))();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.

@UseMoor(tables: [ZaehlerEntry])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future insertEntry(Insertable<Zaehler> newEntry) =>
      into(zaehlerEntry).insert(newEntry);

  Stream<List<Zaehler>> watchEnties() => select(zaehlerEntry).watch();

  Future deleteAll() => delete(zaehlerEntry).go();
  Future<int> length() async {
    return select(zaehlerEntry).get().then((value) {
      return value.length;
    });
  }
}
