
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  
  String _opcionSeleccionada = 'Volar';
  
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(), // Texto
          Divider(),
          _crearEmail(), // Email
          Divider(),
          _crearPassword(), // Pasword
          Divider(),
          _crearFecha(context), // Datepicket
          Divider(),
          _crearDropdown(), // Combo
          Divider(),
          _crearPersona(), // Mostrar
        ],
      ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
      // autofocus: true, // Pone el foco al abrir la pantalla
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() { // Se utiliza para redibujar el widget
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() { // Se utiliza para redibujar el widget
          _email = valor;
        });
      },
    );

  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) {
        setState(() { // Se utiliza para redibujar el widget
          _email = valor;
        });
      },
    );

  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false, // No hacemos focus en el campo
      controller: _inputFieldDateController, // Para controlar el texto que voy a asignar
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker( // ShowTimePicker
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2019), 
      lastDate: DateTime(2021),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
  
  List<DropdownMenuItem<String>> getOpcionesDropdown () {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    });

    return lista;
  }
  
  
  Widget _crearDropdown() {
    return  Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded( // Ocupa toda la pantalla
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(), 
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              }); 
            },
          ),
        ),
      ],
    );
    
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }


}
