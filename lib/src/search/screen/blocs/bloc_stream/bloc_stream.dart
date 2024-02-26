import 'dart:async';

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'event.dart';
part 'state.dart';

class BlocStream extends Bloc<EventStream, StateStream> {
  BlocStream({required FunctionalUsecaseStreamSome usecaseLisenSome})
      : _usecaseLisenSome = usecaseLisenSome,
        super(const StateStream()) {
    on<EventShowStream>(_showStream);
  }

  final FunctionalUsecaseStreamSome _usecaseLisenSome;

  Future<void> _showStream(
    EventShowStream event,
    Emitter<StateStream> emit,
  ) async {
    StreamSubscription<Either<Failure, EntityResponse>>? subscription;
    //usecase
    final result = _usecaseLisenSome(
      const EntityRequest(
        entityObject: EntityExampleObject(),
      ),
    );
    //Response behavior
    subscription = result.listen(
      (result) {
        result.fold(
          (failure) => emit(
            state.copyWith(status: SubmissionStatus.failure),
          ),
          (messages) => emit(
            state.copyWith(
              status: SubmissionStatus.success,
              response: messages,
            ),
          ),
        );
      },
      onError: (dynamic error) {
        emit(state.copyWith(status: SubmissionStatus.failure));
        subscription?.cancel();
      },
      onDone: () => subscription?.cancel(),
    );
  }
}
