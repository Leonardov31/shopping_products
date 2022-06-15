import 'package:dartz/dartz.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/errors/errors.dart';
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart';

abstract class IGetAllProductsUsecase {
  Future<Either<Failure, List<ProductEntity>>> call();
}

class GetAllProductsUsecaseImpl implements IGetAllProductsUsecase {
  final ProductActionsRepository repository;

  GetAllProductsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return repository.getAllProducts();
  }
}
