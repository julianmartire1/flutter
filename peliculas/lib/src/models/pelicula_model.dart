class Peliculas {
  List<Pelicula> items = List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_panguage'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  String getPosterImg() {
    if(posterPath == null) return 'http://www.stleos.uq.edu.au/wp-content/uploads/2016/08/image-placeholder-350x350.png';
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  String getBackgroundImg() {
    if(posterPath == null) return 'http://www.stleos.uq.edu.au/wp-content/uploads/2016/08/image-placeholder-350x350.png';
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
