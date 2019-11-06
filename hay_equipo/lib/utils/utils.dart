List<String> obtenerHoras() {
  int x = 30;
  List<String> times = [];
  int tt = 0;

  for (var i = 0; tt < 24 * 60; i++) {
    double hh = tt.floor() / 60;
    int mm = tt % 60;
    String horas = hh.toInt() < 10 ? "0${hh.toInt()}" : hh.toInt().toString();
    String minutos = mm < 10 ? "0${mm.toInt()}" : mm.toInt().toString();
    times.add("$horas:$minutos");
    tt = tt + x;
  }

  return times;
}
