/*class Movie {
  String backdropPath;
  String overview;
  String posterPath;
  String title;
  double voteAverage;
  int voteCount;

  Movie({
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdropPath'] as String,
      overview: json['overview'] as String,
      posterPath: json['posterPath'] as String,
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdropPath': backdropPath,
      'overview': overview,
      'posterPath': posterPath,
      'title': title,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}*/
