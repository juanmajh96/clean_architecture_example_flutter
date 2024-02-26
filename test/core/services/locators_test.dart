import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('setUpGlobalLocator Test', () {
    test('should register dependencies correctly', () {
      // Arrange
      setUpGlobalLocator();

      // Act
      final repositorySearch = getIt<RepositorySearch>();
      final usecaseGetSome = getIt<FunctionalUsecaseSome>();
      final usecaseListenSome = getIt<FunctionalUsecaseStreamSome>();

      // Assert
      expect(repositorySearch, isA<RepositorySearch>());
      expect(usecaseGetSome, isA<UsecaseGetSome>());
      expect(usecaseListenSome, isA<UsecaseLisenSome>());
    });
  });
}
