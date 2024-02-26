part of 'bloc_future.dart';

@immutable
sealed class EventFuture extends Equatable {}

final class EventShowFuture extends EventFuture {

  EventShowFuture({required this.request});
  final String request;
  @override
  List<Object?> get props => [request];
}
