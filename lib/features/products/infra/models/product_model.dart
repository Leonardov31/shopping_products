import 'dart:convert';

import 'package:shopping_products/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.type,
    required super.rating,
    required super.price,
    required super.photoUrl,
    required super.createdAt,
    required super.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'type': type,
      'rating': rating,
      'price': price,
      'filename': photoUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'],
      type: map['type'] as String,
      rating: map['rating'] as int,
      price: map['price'] as double,
      photoUrl: map['filename'] as String,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      rating: entity.rating,
      price: entity.price,
      photoUrl: entity.photoUrl,
      createdAt: entity.createdAt,
      description: entity.description,
    );
  }

  ProductModel copyWith({
    int? id,
    String? title,
    String? type,
    int? rating,
    double? price,
    String? photoUrl,
    DateTime? createdAt,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
