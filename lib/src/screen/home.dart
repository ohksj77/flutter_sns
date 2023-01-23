import 'package:flutter/material.dart';
import '../widget/feed_item.dart';
import 'feed/feed_create.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My SNS')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 글쓰기 버튼을 누를 경우 동작
          // FeedCreate 위젯을 실행합니다.
          var createPage = MaterialPageRoute(builder: (c) => FeedCreate());
          Navigator.push(context, createPage);
        },
        child: Icon(Icons.create),
      ),
      body: ListView(
        children: const [
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
        ],
      ),
    );
  }
}
