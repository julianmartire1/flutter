import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ReservasPage extends StatefulWidget {
  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas de Hoy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Tus Canchas',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          _swiper()
        ],
      ),
    );
  }

  Widget _swiper2() {
    return Row(
      children: <Widget>[
        Container(
          child: Center(child: Text('5v5')),
          width: 40.0,
        ),
        Expanded(
          child: Container(
            height: 300.0,
            width: 100,
            child: CarouselSlider(
              height: 250,
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(right: 15.0),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                    );
                  },
                );
              }).toList(),
              enableInfiniteScroll: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _swiper() {
    /* return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Center(
                child: Text('5v5', style: TextStyle(color: Colors.white, fontSize: 20.0))),
            width: 45.0,
            height: 210.0,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
          ),
          Expanded(
            child: Container(
              height: 210.0,
              width: 100,
              child: PageView.builder(
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    margin: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                  );
                },
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    ); */

    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Center(
              child: Text('5v5',
                  style: TextStyle(color: Colors.white, fontSize: 20.0))),
          width: 45.0,
          height: 210.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  topRight: Radius.circular(50.0))),
        ),
        Container(
          height: 210.0,
          width: 100,
          child: PageView.builder(
            itemBuilder: (BuildContext context, int i) {
              return Container(
                margin: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
