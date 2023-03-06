import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';

  /*
  *   // https://newsapi.org/v2/top-headlines/sources?apiKey=5c4db488e5844342b7a5e23766725762

  * */
  static Future<SourseResponse> getSource({required String categoryId}) async {
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {'apiKey': '5c4db488e5844342b7a5e23766725762', 'category': categoryId});

    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourseResponse = SourseResponse.fromJson(json);
      return sourseResponse;
    } catch (e) {
      throw e;
    }
  }

  /*
  * https://newsapi.org/v2/everything?q=bitcoin&apiKey=5c4db488e5844342b7a5e23766725762
  * */
  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyword, int? pageNumber}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': '5c4db488e5844342b7a5e23766725762',
      'sources': sourceId,
      'q': searchKeyword,
      'pageSize': '10',
      'page': '$pageNumber'
    });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
