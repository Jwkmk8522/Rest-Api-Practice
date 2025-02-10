class UserModal {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserModal({this.userId, this.id, this.title, this.body});

  UserModal.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
