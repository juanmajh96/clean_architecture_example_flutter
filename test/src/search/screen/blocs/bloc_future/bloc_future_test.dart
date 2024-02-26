import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsecaseGetSome extends Mock implements UsecaseGetSome {}

void main() {
  late MockUsecaseGetSome usecase;
  const request = EntityRequest.empty();
  const response = EntityResponse.empty();
  setUpAll(() {
    usecase = MockUsecaseGetSome();
  });
  group('BlocFuture', () {
    test('initial state is LoadingFuture', () {
      final bloc = BlocFuture(
        usecaseSome: usecase,
      );
      expect(bloc.state, const LoadingFuture());
    });

    group('ShowFuture', () {
      blocTest<BlocFuture, StateFuture>(
        'emits [LoadedFuture] '
        'when usecaseGetSome succeeds',
        setUp: () {
          when(
            () => usecase(request),
          ).thenAnswer((_) async => Future<EntityExchange>.value(const Right(response)));
        },
        build: () => BlocFuture(
          usecaseSome: usecase,
        ),
        act: (bloc) {
          bloc.add(EventShowFuture(request: ''));
        },
        expect: () => const <StateFuture>[
          LoadedFuture(response),
        ],
      );
      blocTest<BlocFuture, StateFuture>(
        'emits [ErrorFuture] '
        'when usecaseGetSome fails',
        setUp: () {
          when(
            () => usecase(request),
          ).thenAnswer((_) => Future<EntityExchange>.value(Left(AppFailure.fromObject(Exception))));
        },
        build: () => BlocFuture(
          usecaseSome: usecase,
        ),
        act: (bloc) {
          bloc.add(EventShowFuture(request: ''));
        },
        expect: () => <StateFuture>[
          const ErrorFuture(),
        ],
      );
    });
  });
}
