import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/data_model.dart';

class DatabaseSource {
  ValueNotifier<List<DataModel>> dataListNotifier = ValueNotifier([]);

  Future<void> saveData(DataModel model, dynamic key) async {
    if (key == null) {
      addData(model);
      return;
    }
    _updateData(model, key);
    getAllData();
  }

  Future<void> addData(DataModel model) async {
    final database = await Hive.openBox<DataModel>('app_db');
    await database.add(model);
    getAllData();
  }

  Future<void> getAllData() async {
    final database = await Hive.openBox<DataModel>('app_db');
    dataListNotifier.value = database.values.toList();
  }

  Future<void> deleteData(int id) async {
    final database = await Hive.openBox<DataModel>('app_db');
    database.delete(id);
    getAllData();
  }

  Future<void> _updateData(DataModel model, dynamic key) async {
    final database = await Hive.openBox<DataModel>('app_db');
    database.put(key, model);
  }
}
