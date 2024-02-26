// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixture_reader.dart';

void main() {
  group('ModelExampleObject', () {
    test('fromJson should return a [ModelExampleObject]', () {
      //Arrange
      final jsonSource = fixture('example.json');
      //Act
      final object = ModelExampleObject.fromJson(jsonSource);
      //Assert
      expect(object, isA<ModelExampleObject>());
    });

    test('fromMap should return a [ModelExampleObject]', () {
      //Arrange
      final dataMap = jsonDecode(fixture('example.json')) as DataMap;
      //Act
      final object = ModelExampleObject.fromMap(dataMap);
      //Assert
      expect(object.variable, equals(''));
    });

    test('empty constructor should create a [ModelExampleObject] empty ', () {
      //Act
      const object = ModelExampleObject.empty();
      //Assert
      expect(object.variable, equals(''));
    });

    group('copyWith method', () {
      const originalObject = ModelExampleObject(variable: 'original');

      test('Verify that the original object remains unchanged', () {
        //Assert
        expect(originalObject.variable, equals('original'));
      });

      test('Verify that the copied object has the updated variable value', () {
        //Act
        final copiedObject = originalObject.copyWith(variable: 'copied');
        //Assert
        expect(copiedObject.variable, equals('copied'));
      });

      test('Verify that the original object remains unchanged with null var', () {
        //Act
        final nullVariableObject = originalObject.copyWith();
        //Assert
        expect(nullVariableObject.variable, equals('original'));
      });
    });

    test('toMap should return a Map', () {
      //Arrange
      const object = ModelExampleObject(variable: 'example');
      //Act
      final map = object.toMap();
      //Assert
      expect(map, isA<Map<String, dynamic>>());
    });

    test('toJson should return a json', () {
      //Arrange
      const object = ModelExampleObject(variable: '');
      final expectedJson = jsonDecode(fixture('example.json'));
      //Act
      final jsonString = object.toJson();
      //Assert
      expect(jsonDecode(jsonString), equals(expectedJson));
    });
  });
}
