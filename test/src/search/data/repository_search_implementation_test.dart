// ignore_for_file: lines_longer_than_80_chars

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/data/data.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatasourceSearch extends Mock implements DatasourceSearch {}

void main() {
  late MockDatasourceSearch datasource;
  late RepositorySearchImplementation repositoryImplementation;
  const response = EntityResponse.empty();
  const request = EntityRequest.empty();
  final serverFailure = ServerFailure.fromException(const ServerException());
  final appFailure = AppFailure.fromObject(Exception);
  const serverException = ServerException();
  const appException = AppException();

  setUpAll(() {
    datasource = MockDatasourceSearch();
    repositoryImplementation = RepositorySearchImplementation(datasourceSearch: datasource);
  });

  group('getFuturemData', () {
    test(
      'should return [EntityResponse] when call to remote source is successful',
      () async {
        //Arrange
        when(() => datasource.getFuture(entityRequest: request)).thenAnswer(
          (_) async => Future<EntityResponse>.value(const EntityResponse.empty()),
        );
        //Act
        final result = await repositoryImplementation.getFutureData(request: request);
        //Assert
        expect(result, equals(const Right<Failure, EntityResponse>(response)));
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful on ServerExeption',
      () async {
        //Arrange
        when(() => datasource.getFuture(entityRequest: request)).thenThrow(serverException);
        //Act
        final result = await repositoryImplementation.getFutureData(request: request);
        //Assert
        expect(
          result,
          equals(Left<Failure, EntityResponse>(serverFailure)),
        );
      },
    );

    test(
      'should return [AppFailure] when call to remote source is '
      'unsuccessful on AnyExeption',
      () async {
        //Arrange
        when(() => datasource.getFuture(entityRequest: request)).thenThrow(appException);
        //Act
        final result = await repositoryImplementation.getFutureData(request: request);
        //Assert
        expect(
          result,
          equals(Left<Failure, EntityResponse>(appFailure)),
        );
      },
    );
  });

  group('getGroups', () {
    const expectedResponse = EntityResponse.empty();

    test(
      'should return a stream of Right<List<Group>> when remote data source '
      'is successful',
      () {
        when(() => datasource.getStream(entityRequest: request)).thenAnswer(
          (_) => Stream.value(expectedResponse),
        );

        final stream = repositoryImplementation.getStreamData(request: request);

        expect(
          stream,
          emits(const Right<Failure, EntityResponse>(expectedResponse)),
        );
      },
    );

    test(
      'should return a stream of Left<Failure> when remote data source throws '
      'an ServerException',
      () {
        when(() => datasource.getStream(entityRequest: request)).thenAnswer(
          (_) => Stream.error(
            const ServerException(),
          ),
        );

        final stream = repositoryImplementation.getStreamData(request: request);

        expect(
          stream,
          emits(equals(Left<Failure, EntityResponse>(serverFailure))),
        );
      },
    );

    test(
      'should return a stream of Left<Failure> when remote data source throws '
      'an anyExeption',
      () {
        when(() => datasource.getStream(entityRequest: request)).thenAnswer(
          (_) => Stream.error(
            const AppException(),
          ),
        );

        final stream = repositoryImplementation.getStreamData(request: request);

        expect(
          stream,
          emits(equals(Left<Failure, EntityResponse>(appFailure))),
        );
      },
    );
  });
}
