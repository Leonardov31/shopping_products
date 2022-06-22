import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:shopping_products/core/helpers/price_format.dart';
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
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleTextController;
  late final TextEditingController typeTextController;
  late final TextEditingController priceTextController;

  final controller = getIt<EditProductController>();

  @override
  void initState() {
    titleTextController = TextEditingController(text: widget.product.title);
    typeTextController = TextEditingController(text: widget.product.type);
    priceTextController = TextEditingController(
        text: PriceFormat.formatToString(widget.product.price));
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
          key: _formKey,
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
                validator: defaultFormValidator,
              ),
              TextFormField(
                controller: typeTextController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Type'),
                ),
                validator: defaultFormValidator,
              ),
              TextFormField(
                controller: priceTextController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    decimalDigits: 2,
                    locale: 'br',
                    symbol: '',
                  )
                ],
                decoration: const InputDecoration(
                  label: Text('Price'),
                  prefix: Text('R\$ '),
                ),
                validator: defaultFormValidator,
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: controller.isLoading,
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed: () async => onSave(context),
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

  void onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var updatedProduct = ProductModel.fromEntity(widget.product);

      updatedProduct = updatedProduct.copyWith(
        title: titleTextController.text.trim(),
        type: typeTextController.text.trim(),
        price: PriceFormat.toDouble(priceTextController.text),
      );

      controller
          .editProduct(updatedProduct)
          .then((value) => Navigator.pop(context));
    }
  }

  String? defaultFormValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field can\'t be empty!';
    }

    return null;
  }
}
