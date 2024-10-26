// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:equatable/equatable.dart';

typedef EntityExchange = Either<Failure, EntityResponse>;

class EntityResponse extends Equatable {
  final List<EntityExampleObject>? list;
  const EntityResponse({
    required this.list,
  });

  const EntityResponse.empty() : list = const [EntityExampleObject.empty()];

  @override
  List<Object?> get props => [list];
}
