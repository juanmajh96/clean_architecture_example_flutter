part of 'bloc_future.dart';

sealed class StateFuture extends Equatable {
  const StateFuture();

  @override
  List<Object> get props => [];
}

final class LoadingFuture extends StateFuture {
  const LoadingFuture();
}

final class LoadedFuture extends StateFuture {
  const LoadedFuture(this.response);

  final EntityResponse response;

  @override
  List<Object> get props => [response];
}

final class ErrorFuture extends StateFuture {
  const ErrorFuture();
}
