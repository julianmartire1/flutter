import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login.bloc.dart';
import 'package:form_validation/src/blocs/productos.bloc.dart';
export 'package:form_validation/src/blocs/login.bloc.dart';

class Provider extends InheritedWidget {
  final _loginBloc = LoginBloc();
  final _productosBloc = ProductosBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if(_instancia == null) {
      _instancia = Provider._(key: key, child: child,);
    }

    return _instancia;
  }

  Provider._({Key key, Widget child}) : super(key: key, child: child);

  // Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        ._loginBloc;
  }

  static ProductosBloc productosBloc(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        ._productosBloc;
  }
}
