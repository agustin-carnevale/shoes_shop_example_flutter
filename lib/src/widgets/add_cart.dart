import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class AddCartButton extends StatelessWidget {
  AddCartButton({Key key, this.price}) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              '\$ $price', 
              style: TextStyle(
                fontSize: 28.0, 
                fontWeight: FontWeight.bold
              ),),
              Spacer(),
              OrangeButton(text: "Add to Cart",),
              SizedBox(width:20),
          ],
        ),
      ),
    );
  }
}