import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:whatsapp_new_design/news_api/news_data_ui_model.dart';
class NewsRepo {
  static Future<List<NewsDataUiModel>> fetchNews() async {
    var client = http.Client();
    List<NewsDataUiModel> newsList=[];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    List result=jsonDecode(response.body);
    for (int i=0;i<result.length;i++) {
      NewsDataUiModel news=NewsDataUiModel.fromMap(result[i] as Map<String, dynamic>);
      newsList.add(news);
    }
    return newsList;
  }
  catch(e) {
    log(e.toString());
    return [];
  }
  }

  static Future<bool> addNews(String title, String body, String userId) async {
    var client = http.Client();
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {
            "title": title,
            "body": body,
            "userId": userId,
          });
    if (response.statusCode>=200 && response.statusCode<300) {
    return true;
    }
    else {
      return false;
    }
  }
  catch(e) {
    log(e.toString());
    return false;
  }
  }
}