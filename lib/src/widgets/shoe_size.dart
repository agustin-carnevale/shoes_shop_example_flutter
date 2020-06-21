import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/zapato_description_page.dart';

class ShoeSizePreview extends StatelessWidget {
  ShoeSizePreview({Key key, this.fullScreen=false}) : super(key: key);
  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
             return ZapatoDescriptionPage();
           }));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5.0 : 30.0, 
          vertical: fullScreen ? 5.0: 0, 
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen? 370 :400,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: 
            fullScreen ? 
            BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
            : BorderRadius.circular(50)
          ),
          child: Column(
            children: <Widget>[
              _ShoeWithShadow(),
              if(!fullScreen)
              _Sizes(),
            ]
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 20,
              right: 0,
              child: ShoeShadow()),
            Image(image: AssetImage(shoeModel.assetImage)),
          ],
        ),
      ),
      
    );
  }
}

class ShoeShadow extends StatelessWidget {
  const ShoeShadow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100),
           boxShadow: [
             BoxShadow(
               color: Color(0xffEAA14E),
               blurRadius: 40,
             )
           ]
        ),
      ),
    );
  }
}

class _Sizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _ShoeSizeBox(7.0),
          _ShoeSizeBox(7.5),
          _ShoeSizeBox(8.0),
          _ShoeSizeBox(8.5),
          _ShoeSizeBox(9.0),
          _ShoeSizeBox(9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  const _ShoeSizeBox(this.size);
  final double size;

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: (){
        shoeModel.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${size.toString().replaceAll('.0', '')}',
          style: TextStyle(
           color: size==shoeModel.size ? Colors.white:Color(0xffF1A23A),
           fontSize: 16.0,
           fontWeight: FontWeight.bold,
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: size==shoeModel.size ? Color(0xffF1A23A):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(size==shoeModel.size)
            BoxShadow(
              color: Color(0xffF1A23A),
              blurRadius: 10,
              offset: Offset(0, 5)
            ),
          ]
        ),
      ),
    );
  }
}