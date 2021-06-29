import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/controller/news_controller.dart';
import 'package:get/get.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments.toString().toUpperCase(),
          style: TextStyle(fontFamily: 'LimeLight'),
        ),
        centerTitle: true,
      ),
      body: Obx(() => newsController.isLoading.value
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: newsController.newsList[index].urlToImage,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Text(
                            newsController.newsList[index].title,
                            style: TextStyle(
                                fontFamily: 'LimeLight', fontSize: 20),
                          ),
                          SizedBox(height: 6),
                          Text(
                            newsController.newsList[index].description,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }),
            )),
    );
  }
}
