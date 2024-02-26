import 'package:automatitation/src/search/data/data.dart';
import 'package:automatitation/src/search/domain/entity_request.dart';
import 'package:automatitation/src/search/domain/entity_response.dart';

class MockGetFuture implements DatasourceSearch {
  @override
  Future<EntityResponse> getFuture({required EntityRequest entityRequest}) async {
    return  Future.delayed(
      const Duration(milliseconds: 2000),
      () => Future.value(const EntityResponse.empty()),
    );
  }

  @override
  Stream<EntityResponse> getStream({required EntityRequest entityRequest}) {
    return Stream.value(const EntityResponse.empty());
  }
}
