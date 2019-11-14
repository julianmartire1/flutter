class Reservas {
  List<ReservaModel> items = List();

  Reservas();

  Reservas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = ReservaModel.fromJsonMap(item);
      items.add(reserva);
    }
  }
}

class ReservaModel {
  int id;
  DateTime fechaAlquiler;
  DateTime horarioDesde;
  int horarioDesdeNum;
  DateTime horarioHasta;
  int horarioHastaNum;
  int idUsuario;
  String nombreUser;
  int idCancha;
  int idPredio;
  int estado;
  DateTime fechaCuandoAlquilo;

  ReservaModel({
    this.id,
    this.fechaAlquiler,
    this.horarioDesde,
    this.horarioDesdeNum,
    this.horarioHasta,
    this.horarioHastaNum,
    this.idUsuario,
    this.nombreUser,
    this.idCancha,
    this.idPredio,
    this.estado,
    this.fechaCuandoAlquilo
  });

  ReservaModel.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    fechaAlquiler = DateTime.parse(json["fechaAlquiler"]);
    horarioDesde = DateTime.parse(json["horarioDesde"]);
    horarioDesdeNum = json["horarioDesdeNum"];
    horarioHasta = DateTime.parse(json["horarioHasta"]);
    horarioHastaNum = json["horarioHastaNum"];
    idUsuario = json["idUsuario"];
    nombreUser = json["nombreUser"];
    idCancha = json["idCancha"];
    idPredio = json["idPredio"];
    estado = json["estado"];
    fechaCuandoAlquilo = DateTime.parse(json["fechaCuandoAlquilo"]);
  }
}
