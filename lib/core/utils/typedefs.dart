import 'package:automatitation/core/core.dart';
export 'package:dartz/dartz.dart' show Either, Left, Right;

//responses Types
typedef FunctionalFuture<T> = Future<Either<Failure, T>>;
typedef FunctionalStream<T> = Stream<Either<Failure, T>>;

//Objects Types
typedef DataMap = Map<String, dynamic>;
