import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key, this.text}) : super(key: key);
  final String text;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: Container(
          margin: EdgeInsets.only(top:20),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Text(text, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
              Spacer(),
              Icon(Icons.search,size: 30,),
            ],
          ),
        ),
      ),
    );
  }
}