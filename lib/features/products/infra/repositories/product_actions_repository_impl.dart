import 'package:dartz/dartz.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/errors/errors.dart';
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart';
import 'package:shopping_products/features/products/infra/datasources/product_datasource.dart';
import 'package:shopping_products/features/products/infra/models/product_model.dart';

class ProductActionsRepositoryImpl implements ProductActionsRepository {
  final ProductDatasource _datasource;

  ProductActionsRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> deleteProduct(int productId) async {
    try {
      await _datasource.deleteProduct(productId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorDeleteProduct(message: 'Error delete product'));
    }
  }

  @override
  Future<Either<Failure, Unit>> editProduct(ProductEntity product) async {
    try {
      final productModel = ProductModel.fromEntity(product);

      await _datasource.editProduct(productModel);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorEditproduct(message: 'Error edit product'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await _datasource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(ErrorGetProducts(message: 'Error get products'));
    }
  }
}
