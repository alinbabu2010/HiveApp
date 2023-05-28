import 'package:flutter/material.dart';

import '../data/source/database_source.dart';
import '../widgets/add_widget.dart';
import '../widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  final databaseSource = DatabaseSource();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    databaseSource.getAllData();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            AddWidget(databaseSource: databaseSource),
            const Divider(
              thickness: 2,
              color: Colors.indigoAccent,
            ),
            Expanded(
              child: ListWidget(
                dataListNotifier: databaseSource.dataListNotifier,
                onDelete: databaseSource.deleteData,
              ),
            )
          ],
        ),
      ),
    );
  }
}
