import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginState', () {
    test('supports value comparisons', () {
      expect(const StateStream(), const StateStream());
    });

    test('returns same object when no properties are passed', () {
      expect(const StateStream().copyWith(), const StateStream());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const StateStream().copyWith(
          status: SubmissionStatus.initial,
          response: const EntityResponse.empty(),
        ),
        const StateStream(),
      );
    });
  });
}
