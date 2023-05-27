import 'package:flutter/cupertino.dart';

import '../model/data_model.dart';

class DatabaseSource {
  final List<DataModel> _dataList = [];

  ValueNotifier<List<DataModel>> dataListNotifier = ValueNotifier([]);

  void addData(DataModel model) {
    _dataList.add(model);
    dataListNotifier.value = [..._dataList];
  }
}
