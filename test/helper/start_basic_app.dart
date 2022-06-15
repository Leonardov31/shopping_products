import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_products/service_locator.dart';

Future<void> startBasicAppTest() async {
  GetIt.I.allowReassignment = true;
  TestWidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
}
