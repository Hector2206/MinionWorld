class MovieModel {

  final String title;
  final String posterPath;
  final double vote;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.vote,
  });

  factory MovieModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return MovieModel(

      title: json['title'] ?? 'Sin título',

      posterPath: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
          : 'https://via.placeholder.com/300x450',

      vote: json['vote_average'] != null
          ? (json['vote_average'] as num).toDouble()
          : 0.0,
    );
  }
}