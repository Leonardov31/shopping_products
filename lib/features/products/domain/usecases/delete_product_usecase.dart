import 'package:dartz/dartz.dart';
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart';

import '../errors/errors.dart';

abstract class IDeleteProductUsecase {
  Future<Either<Failure, Unit>> call(int productId);
}

class DeleteProductUsecaseImpl implements IDeleteProductUsecase {
  final ProductActionsRepository repository;

  DeleteProductUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call(int productId) {
    return repository.deleteProduct(productId);
  }
}
