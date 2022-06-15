import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:shopping_products/features/products/presenter/home_page/home_page.dart';

import '../../../../helper/start_basic_app.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([GetAllProductsUsecaseImpl])
void main() {
  startBasicAppTest();

  late final IGetAllProductsUsecase mockGetProducts;

  setUp(() {
    mockGetProducts = MockGetAllProductsUsecaseImpl();
    GetIt.instance.registerFactory<IGetAllProductsUsecase>(
      () => mockGetProducts,
    );
  });

  final List<ProductEntity> tProducts = [
    ProductEntity(
      description: 'Raw organic brown eggs in a basket',
      id: 0,
      title: 'Brown eggs',
      type: 'dairy',
      rating: 4,
      price: 28.4,
      photoUrl: 'gs://shopping-products-f39f5.appspot.com/0.jpg',
      createdAt: DateTime.parse("2022-06-13 15:38:30.655559"),
    ),
  ];

  testWidgets('Testing if ListView shows up', (tester) async {
    when(mockGetProducts.call()).thenAnswer(
      (_) async => Right(tProducts),
    );

    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    expect(find.byType(ListView), findsOneWidget);
    verify(mockGetProducts.call()).called(1);
  });
}
