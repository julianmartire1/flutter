import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/src/models/producto.model.dart';
import 'package:form_validation/src/services/producto.service.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final productoService = ProductoService();

  ProductoModel producto = ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      producto = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(context),
                _crearBoton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => producto.titulo = value,
      validator: (valor) {
        if (valor.length < 3) return 'Ingrese el nombre del producto';
        return null;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (valor) {
        if (utils.isNumeric(valor)) return null;
        return 'Solo numeros';
      },
    );
  }

  Widget _crearBoton(context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _guardando ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
    _guardando = true;
    setState(() {});

    if(foto != null) {
      producto.url = await productoService.subirImagen(foto);
    }

    if (producto.id == null)
      await productoService.crearProducto(producto);
    else
      await productoService.editarProducto(producto);

    _guardando = false;
    setState(() {});

    mostrarSnackbar('Registro Guardado');
    Navigator.pop(context);
  }

  Widget _crearDisponible(context) {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponble'),
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) {
        setState(() {
          producto.disponible = value;
        });
      },
    );
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _mostrarFoto() {
    if (producto.url != null) {
      return FadeInImage(
        image: NetworkImage(producto.url),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      return foto == null
          ? Image(
              image: AssetImage('assets/no-image.png'),
              height: 300.0,
              fit: BoxFit.cover,
            )
          : Image.file(
              File(foto.path),
              height: 300.0,
              fit: BoxFit.cover,
            );
    }
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource type) async {
    foto = await ImagePicker.pickImage(source: type);
    if (foto != null) {
      producto.url = null;
    }

    setState(() {});
  }
}
