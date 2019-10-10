import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            title: Text('El titulo de la tarjeta'),
            subtitle: Text('Subtitulo de la tarjeta'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {},
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    var card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.nationalgeographic.com/content/dam/photography/photos/000/000/6.ngsversion.1467942028599.adapt.1900.1.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 400),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /* Image(
                image: NetworkImage(
                    'https://www.nationalgeographic.com/content/dam/photography/photos/000/000/6.ngsversion.1467942028599.adapt.1900.1.jpg'),
              ), */
          Container(
            child: Text('No tengo idea de que poner'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]
        ),
    );
  }
}
