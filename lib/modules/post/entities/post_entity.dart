import 'dart:convert';

import '../../auth/entities/user_entity.dart';

class Post {
  final User user;
  final String title;
  final String body;
  final String id;
  Post({
    required this.user,
    required this.title,
    required this.body,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'title': title,
      'body': body,
      'id': id,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
