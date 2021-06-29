import 'package:flutter_news_app/model/news_model.dart';
import 'package:flutter_news_app/service/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var newsList = List<Article>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    var news = await ApiService().getNews(Get.arguments);

    try {
      if (news != null) {
        newsList.addAll(news.articles);
      }
    } finally {
      isLoading(false);
    }
  }
}
