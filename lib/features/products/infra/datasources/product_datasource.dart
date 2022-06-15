import 'package:shopping_products/features/products/infra/models/product_model.dart';

abstract class ProductDatasource {
  Future<void> deleteProduct(int idProduct);
  Future<List<ProductModel>> getAllProducts();
  Future<void> editProduct(ProductModel product);
}
