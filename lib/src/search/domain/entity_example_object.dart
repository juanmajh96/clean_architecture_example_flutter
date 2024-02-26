import 'package:equatable/equatable.dart';

class EntityExampleObject extends Equatable {
  const EntityExampleObject({
    this.variable,
  }) : super();

  const EntityExampleObject.empty() : variable = '';
  final String? variable;
  @override
  List<Object?> get props => [variable];
}
