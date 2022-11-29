// To parse this JSON data, do
//
//     final exhibit = exhibitFromJson(jsonString);

import 'dart:convert';

List<Exhibit> exhibitFromJson(String str) =>
    List<Exhibit>.from(json.decode(str).map((x) => Exhibit.fromJson(x)));

String exhibitToJson(List<Exhibit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exhibit {
  Exhibit({
    required this.title,
    required this.images,
  });

  final String title;
  final List<String> images;

  factory Exhibit.fromJson(Map<String, dynamic> json) => Exhibit(
        title: json["title"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
