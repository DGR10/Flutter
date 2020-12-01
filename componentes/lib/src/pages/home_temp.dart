import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView( // Nos permite hacer scroll en la pantalla
        children: _crearItemsCorto()
      ),
    );
  }


  // List<Widget> _crearItems() {
  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {

      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)
           ..add(Divider( color: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),));
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {

    return opciones.map(( item ) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle from: $item'),
            leading: Icon(Icons.keyboard_arrow_right_sharp),
            trailing: Icon(Icons.arrow_back),
            onTap: () { },
          ),
          Divider()
        ],
      );
    }).toList();

    
  }


}