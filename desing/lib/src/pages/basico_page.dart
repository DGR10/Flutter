import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImage(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImage () {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1-3000x2000.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Paisaje', style: estiloTitulo),
                  SizedBox(height: 7.0),
                  Text('Paisaje de google', style: estiloSubTitulo)
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
            Text('41', style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          'Laboris ea exercitation do est labore incididunt amet adipisicing eu proident consectetur do in. Aute ex ea anim laboris. Sit voluptate dolor Lorem non. Occaecat aliquip elit cillum nulla nisi laborum laboris dolore laborum minim et sit dolor. Eiusmod aliqua minim dolore consequat aliqua anim cupidatat laboris proident. Laboris et enim mollit minim officia id laborum eiusmod dolore do ea eu reprehenderit irure. Nisi nisi nostrud in minim laboris.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}