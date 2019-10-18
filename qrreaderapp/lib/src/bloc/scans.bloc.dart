import 'dart:async';

import 'package:qrreaderapp/src/bloc/validator.dart';
import 'package:qrreaderapp/src/providers/db.provider.dart';

class ScansBloc with Validators{
  static final ScansBloc _singleton = ScansBloc._();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._() {
    obtenerScans();
  }

  final _scanController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scanController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scanController.stream.transform(validarHttp);

  dispose() {
    _scanController?.close();
  }

  obtenerScans() async {
    _scanController.sink.add(await DBProvider.db.getAll());
  }

  agregarScan(ScanModel scan) async{
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScans(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarTodosScans() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}