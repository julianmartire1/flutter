import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/provider.dart';
import 'package:form_validation/src/services/usuario.service.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final userService = UsuarioService();

  bool desabilitarBoton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _registrarForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(context) {
    final fondo = Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circulo,
        ),
        Positioned(
          top: -50.0,
          right: -10.0,
          child: circulo,
        ),
        Positioned(
          top: 120.0,
          right: 20.0,
          child: circulo,
        ),
        Positioned(
          top: 200.0,
          left: -30.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text('Julian Martire',
                  style: TextStyle(color: Colors.white, fontSize: 20.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _registrarForm(context) {
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Crear Cuenta',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                _crearEmail(context, bloc),
                SizedBox(height: 30.0),
                _crearPassword(context, bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc, context)
              ],
            ),
          ),
          FlatButton(
            child: Text('¿Ya tienes cuenta? Login'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail(context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                ),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo Electronico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) => bloc.changeEmail(value),
          ),
        );
      },
    );
  }

  Widget _crearPassword(context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) => bloc.changePassword(value),
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc, context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Crear Cuenta'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: desabilitarBoton ? null : snapshot.hasData ? () => _registrar(bloc, context) : null,
        );
      },
    );
  }

  _registrar(bloc, context) async {
    desabilitarBoton = true;
    setState(() {});

    Map info = await userService.nuevoUsuario(bloc.email, bloc.password);

    desabilitarBoton = false;
    setState(() {});

    if (info['ok']) {
      Navigator.pushNamed(context, 'home');
    } else {
      utils.mostrarAlerta(context, info['message'] ?? 'Error');
    }
    // Navigator.pushNamed(context, 'home');
  }
}
