import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar_example/src/pages/hero_page.dart';
import 'package:table_calendar_example/src/pages/home_page.dart';
import 'package:table_calendar_example/src/pages/principal_page.dart';
import 'package:table_calendar_example/src/pages/second_page.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Calendar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Alata'
      ),
      // locale: Locale('es', 'AR'),
      initialRoute: 'principal',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'second': (BuildContext context) => SecondPage(),
        'hero': (BuildContext context) => HeroPage(),
        'principal': (BuildContext context) => PrincipalPage(),
      },
    );
  }
}
