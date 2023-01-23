import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_flutter/src/repository/feed_repository.dart';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final textController = TextEditingController();
  var snackBar = SnackBar(content: Text('글을 비워둘 수 없습니다.'));
  final ImagePicker _picker = ImagePicker();
  final FeedRepo _feedRepo = FeedRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SNS 작성'),
        actions: [
          IconButton(
              onPressed: () {
                String text = textController.text;
                if (text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  // 실제 글쓰기 REST 통신을 요청하는 부분
                }
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.multiline,
              minLines: null,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(20)),
            ),
          ),
          IconButton(
            onPressed: () async {
              final XFile? file =
                  await _picker.pickImage(source: ImageSource.gallery);
              String result = await _feedRepo.upload(file!.path, file!.name);
              Map json = jsonDecode(result);
              print(json);
            },
            icon: Icon(Icons.image),
          )
        ],
      ),
    );
  }
}
