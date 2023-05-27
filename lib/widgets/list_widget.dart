import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/model/data_model.dart';

class ListWidget extends StatelessWidget {
  final ValueListenable<List<DataModel>> dataListNotifier;

  const ListWidget({
    Key? key,
    required this.dataListNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dataListNotifier,
      builder: (_, dataModelList, child) {
        return ListView.separated(
          itemBuilder: (_, index) {
            var dataModel = dataModelList[index];
            return ListTile(
              title: Text(dataModel.name),
              subtitle: Text(dataModel.age),
            );
          },
          separatorBuilder: (_, index) {
            return const Divider();
          },
          itemCount: dataModelList.length,
        );
      },
    );
  }
}
