import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje Page'),
      ),
      body: Center(child: Text(args),),
    );
  }
}