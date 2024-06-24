import 'dart:convert';

class NewsDataUiModel {
    final int userId;
    final int id;
    final String title;
    final String body;

    NewsDataUiModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    Map<String, dynamic> toMap() {
      return {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}

factory NewsDataUiModel.fromMap(Map<String, dynamic> map) {
  return NewsDataUiModel(
        userId: map["userId"]?.toInt()??0,
        id: map["id"]?.toInt()??0,
        title: map["title"]??"",
        body: map["body"]??"",
    );
}
String toJson() => json.encode(toMap());

  factory NewsDataUiModel.fromJson(String source) => NewsDataUiModel.fromMap(json.decode(source));
}