// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:equatable/equatable.dart';

class EntityRequest extends Equatable {
  final EntityExampleObject? entityObject;
  const EntityRequest({
    this.entityObject,
  });

  const EntityRequest.empty() : entityObject = const EntityExampleObject.empty();

  @override
  List<Object?> get props => [entityObject];
}
