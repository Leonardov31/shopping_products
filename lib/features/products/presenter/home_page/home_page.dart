import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/errors/errors.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/home_controller.dart';
import 'package:shopping_products/features/products/presenter/home_page/widgets/products_list_widget.dart';
import 'package:shopping_products/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product list')),
      body: ValueListenableBuilder<Either<Failure, List<ProductEntity>>>(
        valueListenable: homeController,
        builder: (context, value, _) {
          List<ProductEntity>? products;
          Failure? error;

          value.fold((l) => error = l, (r) => products = r);

          if (error != null) {
            return Center(
              child: Text("${error?.message}"),
            );
          }

          if (products != null) {
            if (products != []) {
              return ProductsListWidget(products: products);
            }

            return const Center(
              child: Text('The product list is empty'),
            );
          }

          return Container();
        },
      ),
    );
  }
}
