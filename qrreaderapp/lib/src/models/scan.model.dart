import 'package:latlong/latlong.dart';

class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    this.valor,
  }){
    if(this.valor.contains('http'))
      this.tipo = 'http';
    else this.tipo = 'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
    id: json["id"],
    tipo: json["tipo"],
    valor: json["valor"],
  );

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "tipo": this.tipo,
    "valor": this.valor,
  };

  getLatLng() {
    final lalo = valor.substring(4).split(',');
    return LatLng(double.parse(lalo[0]), double.parse(lalo[1]));
  }
}
