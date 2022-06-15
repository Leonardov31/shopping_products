import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/errors/errors.dart';
import 'package:shopping_products/features/products/domain/usecases/get_all_products_usecase.dart';

class HomeController
    extends ValueNotifier<Either<Failure, List<ProductEntity>>> {
  final IGetAllProductsUsecase usecase;

  HomeController(this.usecase) : super(const Right([]));

  final isLoading = ValueNotifier<bool>(false);

  getAllProducts() async {
    isLoading.value = true;

    final result = await usecase();
    result.fold(
      (error) => value = Left(error),
      (productEntity) => value = Right(productEntity),
    );

    isLoading.value = false;
  }
}
