import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/theme/theme_app.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => new UiProvider(),),
        ChangeNotifierProvider(create: (BuildContext context) => new ScanListProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (BuildContext context) => HomePage() ,
          '/mapa': (BuildContext context) => MapaPage()
        },
        // theme: ThemeData.dark(),
        theme: MuskTheme().theme(),
        
      ),
    );
  }
}