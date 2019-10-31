import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _mensajesStreamController.stream;

  dispose() {
    _mensajesStreamController.close();
  }

  initNotifications() async {
    _firebaseMessaging.requestNotificationPermissions();

    final String token = await _firebaseMessaging.getToken();

    print('============TOKEN: ($token) ============');
    // drYNzqzZ_2g:APA91bH4Mh5iv7h238xD4z2M-1OS2Zw8bi8cQO39PlzepeV1qaYcprnwNLS_M6PwJuwTKxc6chuaYsqRSaOyPEZTo9OEloy-58jVNfUcg4gobBKMArMKXWFGSe4K_8vX8vshQzx13nN-

    _firebaseMessaging.configure(
      onMessage: (info) async {
        print('====== On Message : $info =======');
        String argumento = 'no-data';
        
        if(Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onLaunch: (info) async {
        print('====== On Launch : $info =======');
        
      },
      onResume: (info) async {
        print('====== On Resume : $info =======');
        
        final noti = info['data']['comida'];
        _mensajesStreamController.sink.add(noti);
      }
    );
  }
}