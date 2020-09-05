import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart' as moor;
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'moor_database.dart';

class BackupScreen extends StatefulWidget {
  const BackupScreen({Key key}) : super(key: key);

  @override
  _BackupScreenState createState() => _BackupScreenState();
}

// https://github.com/simolus3/moor/issues/376
class _BackupScreenState extends State<BackupScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.green,
              child: Text("Backup"),
              onPressed: () async {
                await _backup();
              },
            ),
            MaterialButton(
              color: Colors.green,
              child: Text("Restore"),
              onPressed: () async {
                await _restore();
              },
            ),
          ],
        )),
      ),
    );
  }

  Future<Directory> getSafeDir() async {
    final Directory directory = await getExternalStorageDirectory();
    final Directory exportDir = Directory('${directory.path}/export');
    bool exits = await exportDir.exists();
    if (!exits) {
      await new Directory('${directory.path}/export').create(recursive: true);
    }
    exits = await exportDir.exists();
    if (exits) {
      return exportDir;
    }
    return null;
  }

  Future<void> _backup() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    final Directory exportDir = await getSafeDir();
    final fileBackup = File(p.join(exportDir.path, 'db_backup.sqlite'));

    print(exportDir);
    print(fileBackup);

    final database = Provider.of<MyDatabase>(context, listen: false);
    database.close();

    if (await fileBackup.exists()) {
      await fileBackup.delete();
    }
    await fileBackup.writeAsBytes(await file.readAsBytes(), flush: true);

    // Open Database again ???

    Navigator.pop(context);
  }

  Future<void> _restore() async {
    // File file = await FilePicker.getFile();

    // final dbFolder = await getApplicationDocumentsDirectory();
    // final org = File(p.join(dbFolder.path, 'db.sqlite'));
  }
}
