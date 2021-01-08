class User {
  User({
    this.email,
    this.id,
  });

  String email;
  String id;

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
