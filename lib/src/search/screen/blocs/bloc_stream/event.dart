part of 'bloc_stream.dart';

sealed class EventStream extends Equatable {}

final class EventShowStream extends EventStream {
  EventShowStream();
  @override
  List<Object?> get props => [];
}
