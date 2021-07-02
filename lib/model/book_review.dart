import 'dart:convert';

List<Review> reviewFromJson(String str) =>
    List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

class Review {
  String id;
  String nama;
  String penulis;
  String judul;
  String genre;
  String section;
  String review;

  Review({
    required this.id,
    required this.penulis,
    required this.nama,
    required this.judul,
    required this.genre,
    required this.section,
    required this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id_review"],
        penulis: json["penulis"],
        nama: json["nama"],
        judul: json["judul"],
        genre: json["genre"],
        section: json["section"],
        review: json["review"]

      );
  Map<String, dynamic> toJson() => {
        "id_review": id,
        "nama": nama,
        "judul": judul,
        "genre": genre,
        "section": section,
        "review": review,
      };
}
