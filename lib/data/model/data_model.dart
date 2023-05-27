class DataModel {
  final String name;
  final String age;

  DataModel({required this.name, required this.age});

  @override
  String toString() {
    return "DataModel(name:$name,age:$age)";
  }
}
