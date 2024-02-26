import 'package:automatitation/src/search/screen/screen.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBlocFuture extends MockBloc<EventFuture, StateFuture> implements BlocFuture {}

class MockBlocStream extends MockBloc<EventStream, StateStream> implements BlocStream {}

extension ViewPump on WidgetTester {
  Future<void> viewPump({
    required Widget child,
    required BlocFuture blocFuture,
    required BlocStream blocStream,
  }) {
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: blocFuture),
            BlocProvider.value(value: blocStream),
          ],
          child: RepositoryProvider.value(
            value: ViewModelSearch(
              blocFuture: blocFuture,
              blocStream: blocStream,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
