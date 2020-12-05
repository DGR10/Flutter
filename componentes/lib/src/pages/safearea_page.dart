import 'package:flutter/material.dart';

class SafeAreaPage extends StatefulWidget {

  @override
  _SafeAreaPageState createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('SafeArea'),
       ),
       body: SafeArea(
         child: _lista(),
         top: true,
         bottom: true,
         left: true,
         right: true,
      ),
    );
  }

  Widget _lista() {
    return ListView(
      children: List.generate(
        50, 
        (index) => Text('Texto en el body')),
    );
  }
}