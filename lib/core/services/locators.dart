import 'package:automatitation/src/search/data/data.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/external/external.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpGlobalLocator() {
  getIt
    ..reset()
    ..registerLazySingleton<RepositorySearch>(
      () => RepositorySearchImplementation(
        datasourceSearch: MockGetFuture(),
      ),
    )
    ..registerLazySingleton<FunctionalUsecaseSome>(
      () => UsecaseGetSome(
        getIt<RepositorySearch>(),
      ),
    )
    ..registerLazySingleton<FunctionalUsecaseStreamSome>(
      () => UsecaseLisenSome(getIt<RepositorySearch>()),
    );
}
