// ignore_for_file: lines_longer_than_80_chars

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';

sealed class UsecaseStreamSome<EntityResponse, EntityRequest> {
  FunctionalStream<EntityResponse> call(EntityRequest params);
}

class UsecaseLisenSome implements UsecaseStreamSome<EntityResponse, EntityRequest> {
  const UsecaseLisenSome(this._repository);

  final RepositorySearch _repository;

  @override
  FunctionalStream<EntityResponse> call(EntityRequest params) =>
      _repository.getStreamData(request: params);
}
