
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart'; -> Cupertino es para que se parezca más a IOS
// import 'package:contador/src/pages/home_page.dart';
import 'package:contador/src/pages/contador_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build( context ) {

    return MaterialApp(
      // Quita el debug
      debugShowCheckedModeBanner: false,
      home:  Center(
        // child:  HomePage(),
        child: ContadorPage(),
      )
     
    );

  }

}