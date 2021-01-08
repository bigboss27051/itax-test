
class Todo {
  String todo;
  bool isCompleted;

  Todo({this.todo, this.isCompleted});

  Todo.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo'] = this.todo;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}