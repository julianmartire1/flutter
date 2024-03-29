import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validation/src/preferences/preferencias.preferencias.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final String _apiKey = 'AIzaSyBygCNzp2rhJnxWppI63dFSPLc0ljo2EDA';
  final _pref = PreferenciasUsuario();

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apiKey',
        body: json.encode(authData));
    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _pref.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'message': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey',
        body: json.encode(authData));
    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _pref.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'message': decodeResp['error']['message']};
    }
  }

  void logout(context) {
    _pref.token = null;
    Navigator.pushReplacementNamed(context, 'login');
  }
}
