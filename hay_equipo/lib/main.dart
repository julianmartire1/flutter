import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hay_equipo/pages/home_page.dart';
import 'package:hay_equipo/preferences/preferencias.dart';

import 'pages/login_page.dart';

final prefs = PreferenciasUsuario();

void main() async {
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("TOKEN: ${prefs.token}");
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: prefs.token.isEmpty ? LoginPage.routeName : HomePage.routeName,
      // initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}
// TRABAJO 92:c5:de:44:36:f7:36:c5:13:6e:5b:4f:92:ac:b0:a1:a2:36:f2:ab
// CASA 

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  _login() async {
    try {
      await _googleSignIn.signIn();
      print('\n\n\n\n\n\n\n');
      print('=============Google=============');
      print(_googleSignIn.currentUser);
      print('\n\n\n\n\n\n\n');
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Google'),
          backgroundColor: Colors.orange,
        ),
        body: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /* Image.network(
                        _googleSignIn.currentUser.photoUrl,
                        height: 50.0,
                        width: 50.0,
                      ), */
                      Text(_googleSignIn.currentUser.displayName),
                      OutlineButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        },
                      )
                    ],
                  )
                : Center(
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text("Login with Google"),
                      onPressed: () {
                        _login();
                      },
                    ),
                  )),
      ),
    );
  }
}
 */
