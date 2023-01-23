import 'package:flutter/material.dart';

import '../../widget/my_profile.dart';

class FeedShow extends StatelessWidget {
  const FeedShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyProfile(),
                SizedBox(width: 20),
                Text(
                  '홍길동',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis scelerisque rutrum luctus. Donec volutpat eros ipsum, nec aliquam velit blandit ut. Proin quis neque ut mauris ultricies aliquam maximus sit amet ex. Curabitur lectus lectus, sollicitudin sit amet neque id, posuere cursus elit. In hac habitasse platea dictumst. Nunc in interdum orci. Sed egestas tempor porttitor. Praesent tempus lectus lorem, ac lacinia turpis ullamcorper luctus. Cras tristique nisi id consectetur consectetur.'),
            SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: SizedBox()),
                Text(
                  '2023-01-01',
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: null,
                  child: Text('수정'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                    child: Text('삭제'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("피드 삭제"),
                            content: Text('정말 삭제하시겠습니까'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
