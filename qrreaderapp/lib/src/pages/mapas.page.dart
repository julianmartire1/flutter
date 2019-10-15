import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/providers/db.provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.db.getAll(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if(!snapshot.hasData)
        return Center(child: CircularProgressIndicator());

        final scan = snapshot.data;

        if(scan.length == 0) {
          return Center(child: Text('No hay informacion'),);
        }

        return ListView.builder(
          itemCount: scan.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
            title: Text(scan[i].valor),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          ),
        );
      },
    );
  }
}