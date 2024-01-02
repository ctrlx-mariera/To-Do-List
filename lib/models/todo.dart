class Todo {
  int? id;
  String? title;
  bool? completed;

  Todo.fromJSON(json) {
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }
}
