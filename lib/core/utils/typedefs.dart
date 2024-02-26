import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
export 'package:dartz/dartz.dart' show Either, Left, Right;

//responses Types
typedef FunctionalFuture<T> = Future<Either<Failure, T>>;
typedef FunctionalStream<T> = Stream<Either<Failure, T>>;

//Objects Types
typedef DataMap = Map<String, dynamic>;
typedef EntityExchange = Either<Failure, EntityResponse>;

//Usecases Types
typedef FunctionalUsecaseSome = UsecaseSome<EntityResponse, EntityRequest>;
typedef FunctionalUsecaseStreamSome = UsecaseStreamSome<EntityResponse, EntityRequest>;
