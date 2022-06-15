import 'package:shopping_products/features/products/domain/entities/product_entity.dart';

final List<ProductEntity> tProducts = [
  ProductEntity(
    description: 'Raw organic brown eggs in a basket',
    id: 0,
    title: 'Brown eggs',
    type: 'dairy',
    rating: 4,
    price: 28.4,
    photoUrl: 'gs://shopping-products-f39f5.appspot.com/0.jpg',
    createdAt: DateTime.parse("2022-06-13 15:38:30.655559"),
  ),
  ProductEntity(
    description: 'Sweet fresh stawberry on the wooden table',
    id: 1,
    title: 'Sweet fresh stawberry',
    type: 'fruits',
    rating: 4,
    price: 29.45,
    photoUrl: 'gs://shopping-products-f39f5.appspot.com/1.jpg',
    createdAt: DateTime.parse("2022-06-13 15:38:30.655559"),
  ),
];
