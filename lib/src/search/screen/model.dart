import 'package:equatable/equatable.dart';

class ModelSearch extends Equatable {

  const ModelSearch({
    this.textIsFailure = 'isFailure',
    this.textIsSuccesful = 'isSuccess',
    this.textIsLoading = 'isloading',
    this.textFromFuture = 'Request From a Future',
    this.textFromStream = 'Request From a Stream',
  });
  //static
  final String textIsFailure;
  final String textIsSuccesful;
  final String textIsLoading;
  final String textFromFuture;
  final String textFromStream;

  @override
  List<Object?> get props => [
        textIsFailure,
        textIsSuccesful,
        textIsLoading,
        textFromFuture,
        textFromStream,
      ];
}
