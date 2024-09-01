import 'package:rickandmortyapp/models/location_info.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationInfo origin;
  final LocationInfo location;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  // Método para crear una instancia de Character desde un JSON
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type:json['type'],
      gender: json['gender'],
      origin: LocationInfo.fromJson(json['origin']),
      location: LocationInfo.fromJson(json['location']),
      image: json['image'],
    );
  }
}
