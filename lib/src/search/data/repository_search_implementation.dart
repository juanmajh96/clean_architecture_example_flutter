// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/data/data.dart';
import 'package:automatitation/src/search/domain/domain.dart';

class RepositorySearchImplementation implements RepositorySearch {
  const RepositorySearchImplementation({required this.datasourceSearch});

  final DatasourceSearch datasourceSearch;
  @override
  FunctionalFuture<EntityResponse> getFutureData({required EntityRequest request}) async {
    try {
      final result = await datasourceSearch.getFuture(entityRequest: request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e) {
      return Left(AppFailure.fromObject(e));
    }
  }

  @override
  FunctionalStream<EntityResponse> getStreamData({required EntityRequest request}) {
    return datasourceSearch.getStream(entityRequest: request).transform(_handleStream());
  }

  StreamTransformer<EntityResponse, Either<Failure, EntityResponse>> _handleStream() {
    return StreamTransformer<EntityResponse, Either<Failure, EntityResponse>>.fromHandlers(
      handleError: (error, stackTrace, sink) {
        if (error is ServerException) {
          sink.add(
            Left(ServerFailure.fromException(const ServerException())),
          );
        } else {
          // Handle other types of exceptions as needed
          sink.add(
            Left(AppFailure.fromObject(Exception)),
          );
        }
      },
      handleData: (messages, sink) {
        sink.add(Right(messages));
      },
    );
  }
}
