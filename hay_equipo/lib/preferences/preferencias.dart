import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _preferenciasUsuario =
      PreferenciasUsuario._();

  factory PreferenciasUsuario() {
    return _preferenciasUsuario;
  }

  PreferenciasUsuario._();

  SharedPreferences _preferences;

  initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String get token {
    return _preferences.getString('token') ?? '';
  }

  set token(String value) {
    _preferences.setString('token', value);
  }

  get ultimaPagina {
    return _preferences.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _preferences.setString('ultimaPagina', value);
  }

  String get user {
    return  _preferences.getString('user') ?? null;
  }

  set user(String value) {
    _preferences.setString('user', value);
  }
}
