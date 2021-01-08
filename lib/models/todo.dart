class Todo {
  String todo;
  String createdAt;
  bool isCompleted;

  Todo({this.todo, this.isCompleted, this.createdAt});

  Todo.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    isCompleted = json['isCompleted'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo'] = this.todo;
    data['isCompleted'] = this.isCompleted;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
