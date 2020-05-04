class DetailedMovieData {
  int id;
  int voteCount;
  double voteAverage;
  String releaseDate;
  String title;
  String backdropPath;
  String posterPath;
  double popularity;
  String overview;
  int budget;
  List<String> genres;
  String homepage;
  int runtime;
  int revenue;

  DetailedMovieData.name(
      this.id,
      this.voteCount,
      this.voteAverage,
      this.releaseDate,
      this.title,
      this.backdropPath,
      this.posterPath,
      this.popularity,
      this.overview,
      this.runtime,
      this.revenue,
      this.genres,
      this.budget,
      this.homepage);

  DetailedMovieData.fromJson(Map<String, dynamic> movie) {
    this.id = movie['id'];
    this.voteCount = movie['vote_count'];
    this.voteAverage = movie['vote_average'];
    this.releaseDate = movie['release_date'];
    this.title = movie['title'];
    this.backdropPath = movie['backdrop_path'];
    this.posterPath = movie['poster_path'];
    this.popularity = movie['popularity'];
    this.overview = movie['overview'];
    this.budget = movie['budget'];

    /// this.genres = movie['genres']['id']; ///// la v;.مش صح
    this.homepage = movie['homepage'];
    this.revenue = movie['revenue'];
    this.runtime = movie['runtime'];
  }
}
