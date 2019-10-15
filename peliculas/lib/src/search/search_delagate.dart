import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 2'
  ];
  final peliculasRecientes = ['Spiderman', 'Capitan America'];
  String seleccion = '';
  final peliculasProvider = PeliculasProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a cmostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.cyanAccent,
        child: Center(child: Text(seleccion)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando se escribe
    if (query.isEmpty) return Container();

    return FutureBuilder(
      future: peliculasProvider.getPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final pelicula = snapshot.data;
          return ListView(
            children: pelicula.map((p) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(p.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(p.title),
                subtitle: Text(p.overview, overflow: TextOverflow.ellipsis,),
                onTap: () {
                  close(context, null);
                  p.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: p);
                },
              );
            }).toList(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

/* 

final listaBusqueda = query.isEmpty
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaBusqueda.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaBusqueda[i]),
          onTap: () {
            seleccion = listaBusqueda[i];
            showResults(context);
          },
        );
      },
    );
 */
