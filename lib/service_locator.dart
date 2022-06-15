import 'package:get_it/get_it.dart';
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart';
import 'package:shopping_products/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:shopping_products/features/products/domain/usecases/edit_product_usecase.dart';
import 'package:shopping_products/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:shopping_products/features/products/external/datasources/firebase_datasaource.dart';
import 'package:shopping_products/features/products/infra/datasources/product_datasource.dart';
import 'package:shopping_products/features/products/infra/repositories/product_actions_repository_impl.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/delete_product_controller.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/edit_product_controller.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/home_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => HomeController(getIt()));
  getIt.registerLazySingleton(() => EditProductController(getIt()));
  getIt.registerLazySingleton(() => DeleteProductController(getIt()));

  getIt.registerLazySingleton<IGetAllProductsUsecase>(
    () => GetAllProductsUsecaseImpl(getIt()),
  );

  getIt.registerLazySingleton<IEditProductUsecase>(
    () => EditProductUseCaseImpl(getIt()),
  );

  getIt.registerLazySingleton<IDeleteProductUsecase>(
    () => DeleteProductUsecaseImpl(getIt()),
  );

  getIt.registerLazySingleton<ProductActionsRepository>(
    () => ProductActionsRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<ProductDatasource>(
    () => FirebaseDatasourceImpl(),
  );
}
