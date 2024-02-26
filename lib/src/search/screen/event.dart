import 'package:equatable/equatable.dart';

sealed class EventSearch extends Equatable {}

final class EventShowFuture extends EventSearch {

  EventShowFuture({required this.request});
  final String request;
  @override
  List<Object?> get props => [request];
}

final class EventShowStream extends EventSearch {

  EventShowStream({required this.request});
  final String request;
  @override
  List<Object?> get props => [request];
}
