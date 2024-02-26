import 'dart:convert';

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';

class ModelExampleObject extends EntityExampleObject {
  const ModelExampleObject({
    super.variable,
  });

  factory ModelExampleObject.fromJson(String source) =>
      ModelExampleObject.fromMap(json.decode(source) as DataMap);

  factory ModelExampleObject.fromMap(DataMap map) {
    return ModelExampleObject(
      variable: map['variable'] as String?,
    );
  }

  const ModelExampleObject.empty() : super.empty();

  ModelExampleObject copyWith({
    String? variable,
  }) {
    return ModelExampleObject(
      variable: variable ?? this.variable,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'variable': variable,
    };
  }

  String toJson() => json.encode(toMap());
}
