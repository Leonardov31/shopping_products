import 'package:dartz/dartz.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_products/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:shopping_products/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:shopping_products/features/products/presenter/home_page/controllers/delete_product_controller.dart';
import 'package:shopping_products/features/products/presenter/home_page/home_page.dart';
import 'package:shopping_products/features/products/presenter/home_page/widgets/products_list_widget.dart';
import 'package:shopping_products/service_locator.dart';

import '../../../../helper/mock_producst_list.dart';
import '../../../../helper/start_basic_app.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([IGetAllProductsUsecase, IDeleteProductUsecase, FirebaseImage])
void main() {
  startBasicAppTest();

  final mockGetProducts = MockIGetAllProductsUsecase();
  final mockDeleteProduct = MockIDeleteProductUsecase();

  setUp(() {
    GetIt.instance.registerFactory<IGetAllProductsUsecase>(
      () => mockGetProducts,
    );
    GetIt.instance.registerFactory<IDeleteProductUsecase>(
      () => mockDeleteProduct,
    );
  });

  testWidgets('Should show list of products', (tester) async {
    when(mockGetProducts.call()).thenAnswer(
      (_) async => Right(tProducts),
    );

    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ProductsListWidget), findsOneWidget);

    verify(mockGetProducts.call()).called(1);
  });

  testWidgets('Should delete first product from list', (tester) async {
    when(mockDeleteProduct.call(0)).thenAnswer((_) async {
      tProducts.removeAt(0);
      return const Right(unit);
    });

    await tester.pumpWidget(const _BuildProductList());

    expect(find.text('Brown eggs'), findsOneWidget);
    expect(find.text('Sweet fresh stawberry'), findsOneWidget);

    getIt<DeleteProductController>().deleteProduct(0);
    await tester.pumpWidget(const _BuildProductList());

    expect(find.text('Brown eggs'), findsNothing);
    expect(find.text('Sweet fresh stawberry'), findsOneWidget);

    verify(mockDeleteProduct.call(0)).called(1);
  });
}

class _BuildProductList extends StatelessWidget {
  const _BuildProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProductsListWidget(products: tProducts, isTest: true),
      ),
    );
  }
}
