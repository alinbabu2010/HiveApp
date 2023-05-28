import 'package:flutter/material.dart';
import 'package:hive_app/data/model/data_model.dart';

class AddWidget extends StatefulWidget {
  final DataModel? dataModel;
  final Function(DataModel, dynamic) onAdd;

  const AddWidget({
    Key? key,
    required this.dataModel,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void onAddData() {
    var name = nameController.text;
    var age = ageController.text;
    if (name.isEmpty || age.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    final dataModel = DataModel(
      name: name.trim(),
      age: age.trim(),
    );
    widget.onAdd(dataModel, widget.dataModel?.key);
    nameController.clear();
    ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataModel != null) {
      nameController.text = widget.dataModel!.name;
      ageController.text = widget.dataModel!.age;
    }
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: onAddData,
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          )
        ],
      ),
    );
  }
}
