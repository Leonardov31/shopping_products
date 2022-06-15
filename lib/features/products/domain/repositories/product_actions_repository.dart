import 'package:dartz/dartz.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';

import '../errors/errors.dart';

abstract class ProductActionsRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, Unit>> deleteProduct(int productId);
  Future<Either<Failure, Unit>> editProduct(ProductEntity product);
}
