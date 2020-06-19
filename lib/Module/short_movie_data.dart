class ShortMovieData {
  int id;
  int voteCount;
  double voteAverage;
  String releaseDate;
  String title;
  String backdropPath;
  String posterPath;
  double popularity;
  String overview;
  int currentPage = 0;
  int maxPages;

  ShortMovieData(
      this.id,
      this.voteCount,
      this.voteAverage,
      this.releaseDate,
      this.title,
      this.backdropPath,
      this.posterPath,
      this.popularity,
      this.maxPages,
      this.overview);

  ShortMovieData.fromJson(Map<String, dynamic> movie) {
    this.id = movie['id'];
    this.voteCount = movie['vote_count'];
    this.voteAverage = movie['vote_average'].toDouble();
    this.releaseDate = movie['release_date'];
    this.title = movie['title'];
    this.backdropPath = movie['backdrop_path'];
    this.posterPath = movie['poster_path'];
    this.popularity = movie['popularity'];
    this.overview = movie['overview'];
  }
}
