import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helper_locators.dart';
import 'view_pump.dart';

void main() {
  late MockBlocFuture blocFuture;
  late MockBlocStream blocStream;

  const request = EntityRequest.empty();
  const response = EntityResponse.empty();
  setUpAll(() {
    blocFuture = MockBlocFuture();
    blocStream = MockBlocStream();
    registerFallbackValue(request);
  });

  setUp(() {
    setUpGlobalLocatorTest();
    when(() => getIt<FunctionalUsecaseSome>()(any()))
        .thenAnswer((_) async => Future<EntityExchange>.value(const Right(response)));
    when(() => getIt<FunctionalUsecaseStreamSome>()(any()))
        .thenAnswer((_) => Stream<EntityExchange>.value(const Right(response)));
  });
  tearDown(() {
    getIt.reset();
  });

  group('initial expect ', () {
    test('is routable', () {
      //Assert
      expect(ViewSearch.route(), isA<MaterialPageRoute<void>>());
    });
    testWidgets('renders ViewSearch', (tester) async {
      //Arrange
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const ViewSearch(),
      );
      // Act & Assert
      expect(find.byType(Body), findsOneWidget);
    });
  });

  group('RequestFromFuture', () {
    testWidgets('is loading', (tester) async {
      //Arrange
      when(() => blocFuture.state).thenReturn(const LoadingFuture());
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromFuture(),
      );
      //Assert
      expect(find.text('isloading'), findsOne);
    });
    testWidgets('is error', (tester) async {
      //Arrange
      when(() => blocFuture.state).thenReturn(const ErrorFuture());
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromFuture(),
      );
      //Assert
      expect(find.text('isFailure'), findsOne);
    });

    testWidgets('is loaded with data', (tester) async {
      //Arrange
      when(() => blocFuture.state).thenReturn(const LoadedFuture(response));
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromFuture(),
      );
      //Assert
      expect(find.text('1'), findsOne);
    });

    testWidgets('is loaded without data', (tester) async {
      //Arrange
      when(() => blocFuture.state).thenReturn(const LoadedFuture(EntityResponse(list: null)));
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromFuture(),
      );
      //Assert
      expect(find.text('isSuccess'), findsOne);
    });
  });

  group('RequestFromStream', () {
    testWidgets('is inProgress', (tester) async {
      //Arrange
      when(() => blocStream.state)
          .thenReturn(const StateStream(status: SubmissionStatus.inProgress));
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromStream(),
      );
      //Assert
      expect(find.text('isloading'), findsOne);
    });
    testWidgets('is failure', (tester) async {
      //Arrange
      when(() => blocStream.state).thenReturn(
        const StateStream(status: SubmissionStatus.failure),
      );
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromStream(),
      );
      //Assert
      expect(find.text('isFailure'), findsOne);
    });

    testWidgets('is loaded with data', (tester) async {
      //Arrange
      when(() => blocStream.state).thenReturn(
        const StateStream(status: SubmissionStatus.success),
      );
      //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromStream(),
      );
      //Assert
      expect(find.text('1'), findsOne);
    });

    testWidgets('is loaded without data', (tester) async {
      //Arrange
      when(() => blocStream.state).thenReturn(
        const StateStream(
          status: SubmissionStatus.success,
          response: EntityResponse(list: null),
        ),
      ); //Act
      await tester.viewPump(
        blocFuture: blocFuture,
        blocStream: blocStream,
        child: const RequestFromStream(),
      );
      //Assert
      expect(find.text('isSuccess'), findsOne);
    });
  });
}
