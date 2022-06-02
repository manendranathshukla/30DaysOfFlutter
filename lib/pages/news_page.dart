import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/NewsModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<NewsDetail> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  void getNews() async {
    final http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d2eccaadb59e4fa0b3275a828607f722"));
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['articles'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
          description: newsDetail['description'],
          title: newsDetail['title'],
          url: newsDetail['urlToImage']);
      setState(() {
        items.add(news);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Latest News",
        )),
        body: ListView.builder(
            itemCount: this.items.length, itemBuilder: _listViewItemBuilder));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var newsDetail = this.items[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(newsDetail),
      title: _itemTitle(newsDetail),
    );
  }

  Widget _itemThumbnail(NewsDetail newsDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.url == null
          ? null
          : Image.network(newsDetail.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(NewsDetail newsDetail) {
    return Text(newsDetail.title);
  }
}
