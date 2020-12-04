import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/routes/routes.dart';

import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      // Lenguajes
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
        // ... other locales the app supports
        ],
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/', // Establece cuál es la ruta principal
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) { // Se utiliza para redirigir rutas que no existen
        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage());
      } ,
    );
  }
}