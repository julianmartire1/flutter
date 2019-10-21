import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login.bloc.dart';
export 'package:form_validation/src/blocs/login.bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if(_instancia == null) {
      _instancia = Provider._(key: key, child: child,);
    }

    return _instancia;
  }

  Provider._({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  // Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }
}
