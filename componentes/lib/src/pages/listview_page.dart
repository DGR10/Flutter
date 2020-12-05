import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() { // Se llama antes de que cargue la clase
    super.initState();

    _agregarDiezImagenes();

    _scrollController.addListener(() { 
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregarDiezImagenes();
        fetchData();
      }
    });
  }

  @override
  void dispose() { // Se dispara cuando se cierra la página
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Listas'),
       ),
       body: Stack(
         children: <Widget>[
           _crearLoading(),
           _crearLista(),
         ],
       ), 
       
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerPagina,
        child: ListView.builder(
        controller: _scrollController, // Controlamos el control de la lista
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {

          final imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiezImagenes();
    });

    return Future.delayed(duration);
  }

  void _agregarDiezImagenes() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2);
    new Timer(duration, respuestaHTTP );
  }

  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250), 
    );

    _agregarDiezImagenes();

  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      ); 
    } else {
      return Container();
    }
  }
}