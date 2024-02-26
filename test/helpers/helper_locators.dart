import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockUsecaseSome extends Mock implements UsecaseGetSome {}

class MockUsecaseLisenSome extends Mock implements UsecaseLisenSome {}

void setUpGlobalLocatorTest() {
  getIt = GetIt.instance;
  getIt
    ..registerLazySingleton<FunctionalUsecaseSome>(
      MockUsecaseSome.new,
    )
    ..registerLazySingleton<FunctionalUsecaseStreamSome>(
      MockUsecaseLisenSome.new,
    );
}
