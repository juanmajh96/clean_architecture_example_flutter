// ignore_for_file: lines_longer_than_80_chars

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late final MockRepositorySearch repository;
  late final UsecaseGetSome usecase;
  const response = EntityResponse.empty();
  const request = EntityRequest.empty();
  final cacheFailure = CacheFailure.fromException(const CacheException());

  setUpAll(() {
    repository = MockRepositorySearch();
    usecase = UsecaseGetSome(repository);
  });

  test('usecase responses an EntityResponse', () async {
    //Arrange
    when(() => repository.getFutureData(request: request))
        .thenAnswer((_) async => const Right(response));
    //Act
    final result = await usecase(request);
    //Assert
    expect(result, const Right<dynamic, EntityResponse>(response));
  });

  test('usecase responses a CacheFailure', () async {
    //Arrange
    when(() => repository.getFutureData(request: request)).thenAnswer(
      (_) async => Left(cacheFailure),
    );
    //Act
    final result = await usecase(request);
    //Assert
    expect(
      result,
      Left<CacheFailure, dynamic>(cacheFailure),
    );
  });
}
