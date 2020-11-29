import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {

  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage> {

  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        elevation: 15.8,
        toolbarOpacity: 0.6,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centramos las columnas
          children: [
            Text('Numero de clicks:', style: _estiloTexto),
            Text('$_conteo', style: _estiloTexto),
          ],
        )
      ),
      floatingActionButton: _crearBotones()
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30.0,),
        FloatingActionButton(child: Icon(Icons.refresh), onPressed: _reset,),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _restar,),
        SizedBox(width: 5.0,),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _sumar,),
      ],
    );
    
  }

  void _sumar() { setState(() => _conteo++); }
  void _restar() { setState(() => _conteo--); }
  void _reset() { setState(() => _conteo = 0); }

}