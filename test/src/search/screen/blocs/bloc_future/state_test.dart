import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const entityResponse = EntityResponse(list: [EntityExampleObject.empty()]);
  group('StateFuture', () {
    test('supports value comparisons', () {
      expect(const LoadingFuture(), const LoadingFuture());
    });

    test('supports value comparisons', () {
      const state = LoadedFuture(entityResponse);
      expect(state, state);
    });
  });
}
