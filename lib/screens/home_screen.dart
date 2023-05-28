import 'package:flutter/material.dart';

import '../data/model/data_model.dart';
import '../data/source/database_source.dart';
import '../widgets/add_widget.dart';
import '../widgets/list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseSource = DatabaseSource();

  DataModel? dataModel;

  void setModel(DataModel model) {
    setState(() {
      dataModel = model;
    });
  }

  @override
  void initState() {
    super.initState();
    databaseSource.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            AddWidget(
              dataModel: dataModel,
              onAdd: databaseSource.saveData,
            ),
            const Divider(
              thickness: 2,
              color: Colors.indigoAccent,
            ),
            Expanded(
              child: ListWidget(
                dataListNotifier: databaseSource.dataListNotifier,
                onDelete: databaseSource.deleteData,
                onUpdate: setModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
