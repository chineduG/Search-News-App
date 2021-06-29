import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/news_search.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsSearch(),
    );
  }
}
