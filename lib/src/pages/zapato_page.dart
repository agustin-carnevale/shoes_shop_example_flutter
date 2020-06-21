import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(text: "For you",),
          SizedBox(height: 15),
          Expanded(child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'zapato-1',
                  child: ShoeSizePreview()),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ) ,
          ),
          AddCartButton(price: 180.0),
        ],
      ),
   );
  }
}