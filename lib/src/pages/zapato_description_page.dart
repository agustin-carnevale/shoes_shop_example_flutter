import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag:'zapato-1' ,
                child: ShoeSizePreview(fullScreen: true)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size:60,),
                  onPressed: (){
                    Navigator.pop(context);
                    changeStatusDark();
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _BuyNow(),
                _Colors(),
                _LikeCartButtons(),
            ],
          )
          ),
          )
        ],
      )
   );
  }
}

class _LikeCartButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:30),
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _ShadowButton(Icon(Icons.star, color: Colors.red, size:25)),
           _ShadowButton(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size:25)),
            _ShadowButton(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size:25)),
          
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  _ShadowButton(this.icon);  
  final Icon icon;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: -5,
            blurRadius: 5,
            offset: Offset(0, 10),
          )
        ]
      ),
      child: icon,
    );
  }
}

class _Colors extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
              Positioned(left: 90, child:_ColorButton( color: Color(0xff2099f1),index:4,asset: 'assets/imgs/azul.png')),
              Positioned(left: 60,child:_ColorButton( color: Color(0xffffAd29),index:3,asset: 'assets/imgs/amarillo.png')),
              Positioned(left: 30,child: _ColorButton( color: Color(0xffc6d642),index:2,asset: 'assets/imgs/verde.png')),
              _ColorButton( color: Color(0xff364d56),index:1, asset: 'assets/imgs/negro.png'),
              ],
            ),
          ),
          OrangeButton(text: "More related Items",height: 30, width: 160, color: Color(0xffffc675),)

        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  const _ColorButton({
    Key key, this.color, this.index, this.asset,
  }) : super(key: key);

  final Color color;
  final int index;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index*100),
      duration: Duration(milliseconds:300),
      child: GestureDetector(
        onTap: (){
          shoeModel.assetImage=asset;
        },
        child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
        )
      ),
          ),
    );
  }
}

class _BuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
              Text(
                '\$180.0', 
                style: TextStyle(
                  fontSize: 28.0, 
                  fontWeight: FontWeight.bold
                ),),
                Spacer(),
                Bounce(
                  delay: Duration(microseconds: 750),
                  from: 8,
                  child: OrangeButton(text: "Buy Now", width: 120, height: 40,)),
          ],
        ),
      ),
    );
  }
}