import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  ShoeDescription({Key key, this.title, this.description}) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:20),
            //title
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height:20),
            //description
            Text(
              description,
              style: TextStyle(
                color:Colors.black54,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}