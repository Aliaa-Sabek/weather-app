import 'package:flutter/material.dart';

class ItemDaily extends StatelessWidget {
  final String title, subTitle, image;
  const ItemDaily(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '$subTitle',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      leading: Image.asset(
        image,
        height: 40,
        width: 40,
      ),
    );
  }
}
