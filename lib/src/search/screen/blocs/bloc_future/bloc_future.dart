// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'event.dart';
part 'state.dart';

class BlocFuture extends Bloc<EventFuture, StateFuture> {
  BlocFuture({required FunctionalUsecaseSome usecaseSome})
      : _usecaseSome = usecaseSome,
        super(const LoadingFuture()) {
    on<EventShowFuture>(_showFuture);
  }

  final FunctionalUsecaseSome _usecaseSome;

  Future<void> _showFuture(
    EventShowFuture event,
    Emitter<StateFuture> emit,
  ) async {
    //usecase
    await _usecaseSome(
      EntityRequest(entityObject: EntityExampleObject(variable: event.request)),
    ).then((result) => _handleUsecaseCreate(result, emit));
  }

  void _handleUsecaseCreate(EntityExchange result, Emitter<StateFuture> emit) {
    result.fold(
      (failure) => emit(const ErrorFuture()),
      (entityResponse) => emit(LoadedFuture(entityResponse)),
    );
  }
}
