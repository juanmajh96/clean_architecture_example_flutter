import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException();

  @override
  List<dynamic> get props => [];
}

class CacheException extends Equatable implements Exception {
  const CacheException();

  @override
  List<dynamic> get props => [];
}

class AppException extends Equatable implements Exception {
  const AppException();

  @override
  List<dynamic> get props => [];
}
