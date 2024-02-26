import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late final MockRepositorySearch repository;
  late final UsecaseLisenSome usecase;
  const response = EntityResponse.empty();
  const request = EntityRequest.empty();

  setUpAll(() {
    repository = MockRepositorySearch();
    usecase = UsecaseLisenSome(repository);
  });

  test(
    'should emit [EntityResponse] from the [RepositorySearch]',
    () async {
      //Arrange
      const expectedMessages = response;
      when(() => repository.getStreamData(request: request)).thenAnswer(
        (_) => Stream.value(const Right(expectedMessages)),
      );
      //Act
      final stream = usecase(request);
      //Assert
      expect(
        stream,
        emitsInOrder([const Right<Failure, EntityResponse>(expectedMessages)]),
      );
    },
  );
}
