class Model {
  String? image;
  String movename;
  String overview;
  String mocedate;

  Model({
    this.image,
    required this.movename,
    required this.overview,
    required this.mocedate,
  });

  factory Model.fromjson(Map<String, dynamic> json) {
    return Model(
      image: json["poster_path"] ?? "",
      movename: json["title"] ?? "",
      overview: json["overview"] ?? "",
      mocedate: json["release_date"] ?? "",
    );
  }
}
