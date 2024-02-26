import 'package:automatitation/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  CacheFailure.fromException(this.exception);
  final CacheException exception;
}

class ServerFailure extends Failure {
  ServerFailure.fromException(this.exception);
  final ServerException exception;
}

class AppFailure extends Failure {
  AppFailure.fromObject(this.exception);
  final Object exception;
}
