import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar_example/src/pages/hero_page.dart';
import 'package:table_calendar_example/src/pages/reservas_page.dart';
import 'package:table_calendar_example/src/pages/principal_page.dart';
import 'package:table_calendar_example/src/pages/second_page.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(2, 145, 78, .1),
    100: Color.fromRGBO(2, 145, 78, .2),
    200: Color.fromRGBO(2, 145, 78, .3),
    300: Color.fromRGBO(2, 145, 78, .4),
    400: Color.fromRGBO(2, 145, 78, .5),
    500: Color.fromRGBO(2, 145, 78, .6),
    600: Color.fromRGBO(2, 145, 78, .7),
    700: Color.fromRGBO(2, 145, 78, .8),
    800: Color.fromRGBO(2, 145, 78, .9),
    900: Color.fromRGBO(2, 145, 78, 1),
  };


  @override
  Widget build(BuildContext context) {

    MaterialColor colorCustom = MaterialColor(0xFF02914E, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Calendar Demo',
      theme: ThemeData(primarySwatch: colorCustom, fontFamily: 'Alata'),
      // locale: Locale('es', 'AR'),
      initialRoute: 'principal',
      routes: {
        'reservas': (BuildContext context) => ReservasPage(),
        'second': (BuildContext context) => SecondPage(),
        'hero': (BuildContext context) => HeroPage(),
        'principal': (BuildContext context) => PrincipalPage(),
      },
    );
  }
}
