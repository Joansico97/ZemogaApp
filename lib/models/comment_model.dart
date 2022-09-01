class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.name, this.email, this.body});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    body = json['body'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
