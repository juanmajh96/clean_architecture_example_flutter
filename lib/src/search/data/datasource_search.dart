import 'package:automatitation/src/search/domain/domain.dart';

abstract class DatasourceSearch {
  Future<EntityResponse> getFuture({required EntityRequest entityRequest});

  Stream<EntityResponse> getStream({required EntityRequest entityRequest});
}
