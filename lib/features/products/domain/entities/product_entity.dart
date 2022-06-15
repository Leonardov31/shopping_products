import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String type;
  final int rating;
  final double price;
  final String photoUrl;
  final DateTime createdAt;

  const ProductEntity({
    required this.description,
    required this.id,
    required this.title,
    required this.type,
    required this.rating,
    required this.price,
    required this.photoUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, title, type, rating, price, photoUrl, createdAt];
}
