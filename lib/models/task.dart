class Task {
  final String name;
  bool isDone;
  Task({this.name, this.isDone = false});

  Map<String, dynamic> toJson() => {
        'name': name,
        'isDone': isDone,
      };

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isDone = json['isDone'];
}
