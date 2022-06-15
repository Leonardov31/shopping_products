import 'package:flutter/material.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/delete_product_controller.dart';
import 'package:shopping_products/service_locator.dart';

import '../../../domain/entities/product_entity.dart';

Future<dynamic> deleteProductDialog(
  BuildContext context,
  ProductEntity product,
) {
  final controller = getIt<DeleteProductController>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete product'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('This action will delete the product: ${product.title}'),
          ],
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.red,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.teal,
          ),
          onPressed: () async {
            controller
                .deleteProduct(product.id)
                .then((value) => Navigator.pop(context));
          },
          child: const Text('Approve'),
        ),
      ],
    ),
  );
}
