import 'package:flutter_test/flutter_test.dart';
import 'package:transiter_driver/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('GeofireServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}