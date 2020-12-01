import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
          );
        }
      
  Widget _lista() {
    // menuProvider.cargarData();
    // Un Future tiene varios estados, cuando se está pidiendo información, cuando se resuelve y cuando da un error
    return FutureBuilder(
      future: menuProvider.cargarData(), // Regresa un Future
      initialData: [], // Información por defecto mientras carga un future builder
      builder: ( BuildContext contex, AsyncSnapshot<List<dynamic>> snapshop) {

        return ListView(
          children: _listaItems(snapshop.data, contex),
        );

      },
    );

  }

  List<Widget>_listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          print(opt['ruta']);
          Navigator.pushNamed(context, opt['ruta']);

          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );
          // Navigator.push(context, route);


        },
      );

      opciones..add(widgetTemp)
              ..add( Divider());
    });

    return opciones;

  }
}