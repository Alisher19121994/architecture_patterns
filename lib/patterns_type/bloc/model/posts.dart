class PostBloc{
  int id;
  String title;
  String body;
  int userId;

  PostBloc({required this.id, required this.title, required this.body, required this.userId});

  PostBloc.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'userId': userId,
  };
}