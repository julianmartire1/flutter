import 'package:flutter/material.dart';
import 'package:push_notification/src/pages/home.page.dart';
import 'package:push_notification/src/pages/mensaje.page.dart';
import 'package:push_notification/src/services/push-notification.service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushService = PushNotificationService();
    pushService.initNotifications();

    pushService.mensajes.listen((data) {
     // Navigator.pushNamed(context, 'mensaje');
     
      print('=================argumento================');
      print(data);

      navigatorKey.currentState.pushNamed('mensaje', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Local',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext c) => HomePage(),
        'mensaje': (BuildContext c) => MensajePage(),
      },
    );
  }
}
