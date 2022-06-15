import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:shopping_products/features/products/infra/datasources/product_datasource.dart';
import 'package:shopping_products/features/products/infra/models/product_model.dart';

class FirebaseDatasourceImpl implements ProductDatasource {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Future<void> deleteProduct(int idProduct) async {
    final ref = database.ref();

    final key = await ref.child(idProduct.toString()).get();

    if (key.exists) {
      await ref.child(idProduct.toString()).remove();
    }
  }

  @override
  Future<void> editProduct(ProductModel product) async {
    final ref = database.ref();

    final key = await ref.child('${product.id}').get();

    if (key.exists) {
      await ref.child('${product.id}').update(product.toMap());
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final ref = database.ref();

    final snapshot = await ref.get();

    if (snapshot.exists) {
      final List<ProductModel> products = snapshot.children.map((e) {
        final Map<String, dynamic> map = jsonDecode(jsonEncode(e.value));

        map["id"] = int.parse(e.key as String);

        return ProductModel.fromMap(map);
      }).toList();

      return products;
    }

    return [];
  }
}
