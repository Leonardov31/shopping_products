import 'package:shopping_products/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/home_controller.dart';
import 'package:shopping_products/service_locator.dart';

class DeleteProductController {
  final IDeleteProductUsecase _usecase;

  DeleteProductController(this._usecase);

  Future<void> deleteProduct(int id) async {
    final result = await _usecase(id);

    if (result.isRight()) {
      getIt<HomeController>().getAllProducts();
    }
  }
}
