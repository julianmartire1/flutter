class ReservaModel {
  int id;
  DateTime fechaAlquiler;
  DateTime horarioDesde;
  int horarioDesdeNum;
  DateTime horarioHasta;
  int horarioHastaNum;
  int idUsuario;
  int idCancha;
  int idPredio;
  int estado;

  ReservaModel({
    this.id,
    this.fechaAlquiler,
    this.horarioDesde,
    this.horarioDesdeNum,
    this.horarioHasta,
    this.horarioHastaNum,
    this.idUsuario,
    this.idCancha,
    this.idPredio,
    this.estado,
  });
}
