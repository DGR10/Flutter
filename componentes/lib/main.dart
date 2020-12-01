import 'package:flutter/material.dart';
 
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/routes/routes.dart';

import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
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