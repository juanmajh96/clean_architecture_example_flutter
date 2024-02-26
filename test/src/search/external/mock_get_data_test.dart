import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/external/external.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEntityRequest extends Mock implements EntityRequest {}

void main() {
  group('MockGetFuture Test', () {
    test('getFuture should return EntityResponse after delay', () async {
      // Arrange
      final mockEntityRequest = MockEntityRequest();
      final mockGetFuture = MockGetFuture();

      // Act
      final result = await mockGetFuture.getFuture(entityRequest: mockEntityRequest);

      // Assert
      expect(result, isA<EntityResponse>());
    });

    test('getStream should return Stream<EntityResponse>', () {
      // Arrange
      final mockEntityRequest = MockEntityRequest();
      final mockGetFuture = MockGetFuture();

      // Act
      final resultStream = mockGetFuture.getStream(entityRequest: mockEntityRequest);

      // Assert
      expect(resultStream, isA<Stream<EntityResponse>>());
    });
  });
}
