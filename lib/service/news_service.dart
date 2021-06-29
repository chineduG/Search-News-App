import 'package:flutter_news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // var client = http.Client();
  //
  // // ignore: missing_return
  // Future<News> getNews(String query) async {
  //   var res = await client.get(Uri.parse(
  //       'https://newsapi.org/v2/everything?q=$query&apiKey=9123ef000e224213a43789f65f118112'));
  //   if (res.statusCode == 200) {
  //     var jsonString = res.body;
  //     return newsFromJson(jsonString);
  //   }
  // }

  // ignore: missing_return
  Future<News> getNews(String query) async {
    var url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=9123ef000e224213a43789f65f118112';
    var client = await http.get(Uri.parse(url));
    if (client.statusCode == 200) {
      var res = client.body;
      return newsFromJson(res);
    }
  }
}
