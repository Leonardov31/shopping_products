import 'package:flutter/cupertino.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/usecases/edit_product_usecase.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/home_controller.dart';
import 'package:shopping_products/service_locator.dart';

class EditProductController {
  final IEditProductUsecase _usecase;

  EditProductController(this._usecase);

  final isLoading = ValueNotifier(false);

  Future<void> editProduct(ProductEntity product) async {
    isLoading.value = true;

    final result = await _usecase(product);
    if (result.isRight()) {
      await getIt<HomeController>().getAllProducts();
    }

    isLoading.value = false;
  }
}
