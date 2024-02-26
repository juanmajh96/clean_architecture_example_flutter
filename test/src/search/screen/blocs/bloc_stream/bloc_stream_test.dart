import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsecaseLisenSome extends Mock implements UsecaseLisenSome {}

void main() {
  late MockUsecaseLisenSome usecase;
  const request = EntityRequest.empty();
  const response = EntityResponse.empty();
  setUpAll(() {
    usecase = MockUsecaseLisenSome();
    registerFallbackValue(request);
  });
  group('BlocStream', () {
    test('initial state is StateStream', () {
      final bloc = BlocStream(
        usecaseLisenSome: usecase,
      );
      expect(bloc.state, const StateStream());
    });

    group('ShowStream', () {
      blocTest<BlocStream, StateStream>(
        'emits [ submissionSuccess] '
        'when usecaseLisenSome succeeds',
        setUp: () {
          when(
            () => usecase(any()),
          ).thenAnswer((_) => Stream<EntityExchange>.value(const Right(response)));
        },
        build: () => BlocStream(
          usecaseLisenSome: usecase,
        ),
        act: (bloc) {
          bloc.add(EventShowStream());
        },
        expect: () => const <StateStream>[
          StateStream(status: SubmissionStatus.success),
        ],
      );

      blocTest<BlocStream, StateStream>(
        'emits [submissionfailure] '
        'when usecaseLisenSome fails',
        setUp: () {
          when(
            () => usecase(any()),
          ).thenAnswer((_) => Stream<EntityExchange>.value(Left(AppFailure.fromObject(Exception))));
        },
        build: () => BlocStream(
          usecaseLisenSome: usecase,
        ),
        act: (bloc) {
          bloc.add(EventShowStream());
        },
        expect: () => const <StateStream>[
          StateStream(status: SubmissionStatus.failure),
        ],
      );

      blocTest<BlocStream, StateStream>(
        'emits [submissionfailure] '
        'when subscription fails',
        setUp: () {
          when(
            () => usecase(any()),
          ).thenAnswer(
            (_) => Stream<EntityExchange>.error(
              Left<Failure, EntityResponse>(AppFailure.fromObject(Exception)),
            ),
          );
        },
        build: () => BlocStream(
          usecaseLisenSome: usecase,
        ),
        act: (bloc) {
          bloc.add(EventShowStream());
        },
        expect: () => const <StateStream>[
          StateStream(status: SubmissionStatus.failure),
        ],
      );
    });
  });
}
