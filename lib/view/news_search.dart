import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/news_view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewsSearch extends StatefulWidget {
  String category;
  NewsSearch({this.category});

  @override
  _NewsSearchState createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsGetX'),
        leading: IconButton(
            tooltip: 'Change Theme',
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
            icon: Icon(Icons.lightbulb_outline != null
                ? Icons.lightbulb
                : Icons.lightbulb_outline)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/feeds.png'),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: InkWell(
                  onTap: () {
                    Get.to(() => NewsView(), arguments: '$_controller');
                  },
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.blue,
                        onPressed: () {
                          Get.to(() => NewsView(), arguments: widget.category);
                        },
                      ),
                      hintText: 'Search Articles',
                      border: InputBorder.none,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        widget.category = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
