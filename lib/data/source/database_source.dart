import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/data_model.dart';

class DatabaseSource {
  ValueNotifier<List<DataModel>> dataListNotifier = ValueNotifier([]);

  Future<void> addData(DataModel model) async {
    final database = await Hive.openBox<DataModel>('app_db');
    await database.add(model);
    getAllData();
  }

  Future<void> getAllData() async {
    final database = await Hive.openBox<DataModel>('app_db');
    dataListNotifier.value = database.values.toList();
  }
}
