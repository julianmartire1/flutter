import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/productos.bloc.dart';
import 'package:form_validation/src/blocs/provider.dart';
import 'package:form_validation/src/models/producto.model.dart';
import 'package:form_validation/src/services/producto.service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: _traerListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _traerListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productoStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        final productos = snapshot.data;
        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return _crearItem(productos[index], context, productosBloc);
          },
        );
      },
    );

    /* FutureBuilder(
      future: productosService.traerProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        final productos = snapshot.data;
        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return _crearItem(productos[index], context);
          },
        );
      },
    ); */
  }

  Widget _crearItem(ProductoModel producto, BuildContext context, ProductosBloc productosBloc) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      child: Card(
        child: Column(
          children: <Widget>[
            producto.url == null
                ? Image(
                    image: AssetImage('assets/no-image.png'),
                  )
                : FadeInImage(
                    image: NetworkImage(producto.url),
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300.0,
                  ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text('${producto.id}'),
              onTap: () =>
                  Navigator.pushNamed(context, 'producto', arguments: producto),
            )
          ],
        ),
      ),
      onDismissed: (direction) {
        // productosService.eliminarProducto(producto.id);
        productosBloc.borrarProducto(producto.id);
      },
    );
  }
  /**
   * 
   * ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text('${producto.id}'),
        onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
      )
   */
}
