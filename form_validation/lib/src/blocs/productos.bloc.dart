import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:form_validation/src/services/producto.service.dart';
import 'package:form_validation/src/models/producto.model.dart';

class ProductosBloc {
  final _productosController = BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = BehaviorSubject<bool>();

  final _productoService = ProductoService();

  Stream<List<ProductoModel>> get productoStream => _productosController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;

  cargarProductos() async {
    final productos = await _productoService.traerProductos();
    _productosController.sink.add(productos);
  }

  agregarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productoService.crearProducto(producto);
    _cargandoController.sink.add(false);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);
    final fotoUrl = await _productoService.subirImagen(foto);
    _cargandoController.sink.add(false);
    return fotoUrl;
  }

  editarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productoService.editarProducto(producto);
    _cargandoController.sink.add(false);
  }

  borrarProducto(String id) async {
    await _productoService.eliminarProducto(id);
  }

  dispose() {
    _productosController?.close();
    _cargandoController?.close();
  }
}