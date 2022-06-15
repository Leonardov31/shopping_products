import 'package:dartz/dartz.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/errors/errors.dart';
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart';

abstract class IEditProductUsecase {
  Future<Either<Failure, Unit>> call(ProductEntity product);
}

class EditProductUseCaseImpl implements IEditProductUsecase {
  final ProductActionsRepository repository;

  EditProductUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ProductEntity product) async {
    return await repository.editProduct(product);
  }
}
