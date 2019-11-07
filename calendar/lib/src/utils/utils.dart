class Horas {
  int numero;
  String hora;

  Horas({
    this.numero,
    this.hora
  });
}

List<Horas> obtenerHoras() {
  int x = 30;
  List<Horas> times = List<Horas>();
  int tt = 0;
  int h = 0;
  for (var i = 0; tt < 24 * 60; i++) {
    double hh = tt.floor() / 60;
    int mm = tt % 60;
    String horas = hh.toInt() < 10 ? "0${hh.toInt()}" : hh.toInt().toString();
    String minutos = mm < 10 ? "0${mm.toInt()}" : mm.toInt().toString();
    //times.add("$horas:$minutos");

    times.add(Horas(numero: h, hora: "$horas:$minutos"));

    tt = tt + x;
    h++;
  }
  
  times.add(Horas(numero: h, hora: "00:00"));
  //times.add("00:00");
  // print(times.length); 49
  return times;
}
