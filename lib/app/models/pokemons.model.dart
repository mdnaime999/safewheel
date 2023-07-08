// To parse this JSON data, do
//
//     final mPokemon = mPokemonFromJson(jsonString);

import 'dart:convert';

List<MPokemon> mPokemonFromJson(String str) => List<MPokemon>.from(json.decode(str).map((x) => MPokemon.fromJson(x)));

String mPokemonToJson(List<MPokemon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MPokemon {
  final String? id;
  final String? number;
  final String? name;
  final Eight? height;
  final Eight? weight;
  final String? classification;
  final String? image;

  MPokemon({
    this.id,
    this.number,
    this.name,
    this.height,
    this.weight,
    this.classification,
    this.image,
  });

  factory MPokemon.fromJson(Map<String, dynamic> json) => MPokemon(
        id: json["id"],
        number: json["number"],
        name: json["name"],
        height: Eight.fromJson(json["height"]),
        weight: Eight.fromJson(json["weight"]),
        classification: json["classification"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "height": height!.toJson(),
        "weight": weight!.toJson(),
        "classification": classification,
        "image": image,
      };
}

class Eight {
  final String? minimum;
  final String? maximum;

  Eight({
    this.minimum,
    this.maximum,
  });

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        minimum: json["minimum"],
        maximum: json["maximum"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "maximum": maximum,
      };
}
