import 'package:flutter/material.dart';

import '../screen/feed/feed_show.dart';
import 'my_profile.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (b) => FeedShow()));
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyProfile(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        '홍길동',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '2023-01-19',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis scelerisque rutrum luctus. Donec volutpat eros ipsum, nec aliquam velit blandit ut. Proin quis neque ut mauris ultricies aliquam maximus sit amet ex. Curabitur lectus lectus, sollicitudin sit amet neque id, posuere cursus elit. In hac habitasse platea dictumst. Nunc in interdum orci. Sed egestas tempor porttitor. Praesent tempus lectus lorem, ac lacinia turpis ullamcorper luctus. Cras tristique nisi id consectetur consectetur.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
