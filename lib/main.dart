import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/zapato_page.dart';
 
void main() => runApp(
  
  ChangeNotifierProvider(
    create: (_)=> ShoeModel(),
    child: MyApp()
  )

);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      // home: ZapatoPage(),
      home: ZapatoPage(),
    );
  }
}