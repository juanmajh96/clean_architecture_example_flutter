part of 'bloc_stream.dart';

@immutable
final class StateStream extends Equatable {
  const StateStream({
    this.response = const EntityResponse.empty(),
    this.status = SubmissionStatus.initial,
  });
  final EntityResponse response;
  final SubmissionStatus status;

  StateStream copyWith({
    EntityResponse? response,
    SubmissionStatus? status,
  }) {
    return StateStream(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [response, status];

  @override
  bool? get stringify => true;
}
