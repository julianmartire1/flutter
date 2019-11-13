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
}
