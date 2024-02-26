// ignore_for_file: lines_longer_than_80_chars

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';

abstract class RepositorySearch {
  FunctionalFuture<EntityResponse> getFutureData({required EntityRequest request});

  FunctionalStream<EntityResponse> getStreamData({required EntityRequest request});
}
