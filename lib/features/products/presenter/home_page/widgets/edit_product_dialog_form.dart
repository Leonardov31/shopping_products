import 'package:flutter/material.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/infra/models/product_model.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/edit_product_controller.dart';
import 'package:shopping_products/service_locator.dart';

Future<dynamic> editProductForm(BuildContext context, ProductEntity product) {
  return showDialog(
    context: context,
    builder: (context) {
      return ProductForm(product: product);
    },
  );
}

class ProductForm extends StatefulWidget {
  const ProductForm({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late final TextEditingController titleTextController;
  late final TextEditingController typeTextController;
  late final TextEditingController priceTextController;

  final controller = getIt<EditProductController>();

  @override
  void initState() {
    titleTextController = TextEditingController(text: widget.product.title);
    typeTextController = TextEditingController(text: widget.product.type);
    priceTextController =
        TextEditingController(text: widget.product.price.toStringAsFixed(2));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleTextController.dispose();
    typeTextController.dispose();
    priceTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit product'),
      content: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleTextController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              TextFormField(
                controller: typeTextController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Type'),
                ),
              ),
              TextFormField(
                controller: priceTextController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: controller.isLoading,
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed: () async {
                      var updatedProduct =
                          ProductModel.fromEntity(widget.product);

                      updatedProduct = updatedProduct.copyWith(
                        title: titleTextController.text.trim(),
                        type: typeTextController.text.trim(),
                        price: double.parse(priceTextController.text),
                      );

                      controller
                          .editProduct(updatedProduct)
                          .then((value) => Navigator.pop(context));
                    },
                    child: !controller.isLoading.value
                        ? const Text('Save')
                        : const LinearProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
