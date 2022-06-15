// Mocks generated by Mockito 5.2.0 from annotations
// in shopping_products/test/features/products/presenter/home_page/home_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shopping_products/features/products/domain/entities/product_entity.dart'
    as _i7;
import 'package:shopping_products/features/products/domain/errors/errors.dart'
    as _i6;
import 'package:shopping_products/features/products/domain/repositories/product_actions_repository.dart'
    as _i2;
import 'package:shopping_products/features/products/domain/usecases/get_all_products_usecase.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeProductActionsRepository_0 extends _i1.Fake
    implements _i2.ProductActionsRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetAllProductsUsecaseImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProductsUsecaseImpl extends _i1.Mock
    implements _i4.GetAllProductsUsecaseImpl {
  MockGetAllProductsUsecaseImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductActionsRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeProductActionsRepository_0())
          as _i2.ProductActionsRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
          returnValue:
              Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>>.value(
                  _FakeEither_1<_i6.Failure, List<_i7.ProductEntity>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>>);
}