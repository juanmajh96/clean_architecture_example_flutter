import 'package:automatitation/src/search/screen/blocs/blocs.dart';
import 'package:automatitation/src/search/screen/model.dart';

class ViewModelSearch {
  ViewModelSearch({
    required BlocFuture blocFuture,
    required BlocStream blocStream,
  })  : _blocFuture = blocFuture,
        _blocStream = blocStream,
        _model = const ModelSearch(),
        super();

  final BlocFuture _blocFuture;
  final BlocStream _blocStream;

  // Output
  final ModelSearch _model;

  ModelSearch get model => _model;

  Future<void> showFuture(String request) async {
    _blocFuture.add(
      EventShowFuture(
        request: request,
      ),
    );
  }

  Future<void> showStream(String request) async {
    _blocStream.add(
      EventShowStream(),
    );
  }
}
