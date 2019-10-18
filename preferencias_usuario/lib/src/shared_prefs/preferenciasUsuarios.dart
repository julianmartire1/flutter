import 'package:preferencias_usuario/src/pages/home.page.dart';
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

  get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _preferences.setInt('genero', value);
  }

  get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _preferences.setBool('colorSecundario', value);
  }

  get nombreUsuario {
    return _preferences.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _preferences.setString('nombreUsuario', value);
  }

  get ultimaPagina {
    return _preferences.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _preferences.setString('ultimaPagina', value);
  }
}
