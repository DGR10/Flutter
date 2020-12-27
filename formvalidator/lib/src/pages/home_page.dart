import 'package:flutter/material.dart';
import 'package:formvalidator/src/bloc/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home')
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Email: ${bloc.email}'),
              Divider(),
              Text('Password: ${bloc.password}'),
            ],
          ),
      ),
    );
  }
}