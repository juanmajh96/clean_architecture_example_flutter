// ignore_for_file: lines_longer_than_80_chars

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';

typedef FunctionalUsecaseSome = UsecaseSome<EntityResponse, EntityRequest>;

sealed class UsecaseSome<EntityResponse, EntityRequest> {
  FunctionalFuture<EntityResponse> call(EntityRequest params);
}

class UsecaseGetSome implements UsecaseSome<EntityResponse, EntityRequest> {
  const UsecaseGetSome(this._repository);

  final RepositorySearch _repository;

  @override
  FunctionalFuture<EntityResponse> call(EntityRequest params) =>
      _repository.getFutureData(request: params);
}
