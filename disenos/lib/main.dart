import 'package:disenos/src/pages/basico.page.dart';
import 'package:disenos/src/pages/botones.page.dart';
import 'package:disenos/src/pages/scroll.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Color(0x00000000),
      )
    );
    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      initialRoute: 'botones',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'botones': (BuildContext context) => BotonesPage(),
      },
    );
  }
}
