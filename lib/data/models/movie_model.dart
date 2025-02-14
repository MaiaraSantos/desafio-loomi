class MovieModel {
  final int id;
  final String title;
  final String description;
  final String posterUrl;

  MovieModel({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      posterUrl: json['poster']['url'],
    );
  }
}
