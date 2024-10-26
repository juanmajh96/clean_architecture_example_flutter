import 'package:automatitation/core/core.dart';
import 'package:automatitation/src/search/domain/domain.dart';
import 'package:automatitation/src/search/screen/blocs/blocs.dart';
import 'package:automatitation/src/search/screen/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSearch extends StatelessWidget {
  const ViewSearch({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ViewSearch());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocFuture>(
          create: (context) => BlocFuture(
            usecaseSome: getIt<FunctionalUsecaseSome>(),
          ),
        ),
        BlocProvider<BlocStream>(
          create: (context) => BlocStream(
            usecaseLisenSome: getIt<FunctionalUsecaseStreamSome>(),
          ),
        ),
      ],
      child: RepositoryProvider<ViewModelSearch>(
        create: (context) => ViewModelSearch(
          blocFuture: context.read<BlocFuture>(),
          blocStream: context.read<BlocStream>(),
        )
          ..showFuture('request')
          ..showStream('request'),
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(
              Dimens.paddingScaffold,
            ),
            child: Body(),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RequestFromFuture(),
          RequestFromStream(),
        ],
      ),
    );
  }
}

class RequestFromFuture extends StatelessWidget {
  const RequestFromFuture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModelSearch>();
    return Column(
      children: [
        Text(
          viewModel.model.textFromFuture,
          style: const TextStyle(
            fontSize: Dimens.textTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<BlocFuture, StateFuture>(
          builder: (context, state) {
            return switch (state) {
              LoadingFuture() => Text(viewModel.model.textIsLoading),
              ErrorFuture() => Text(viewModel.model.textIsFailure),
              LoadedFuture() => Text(
                  key: Key(viewModel.model.textIsSuccesful),
                  state.response.list?.let(
                        (self) => self.length.toString(),
                      ) ??
                      viewModel.model.textIsSuccesful,
                ),
            };
          },
        ),
      ],
    );
  }
}

class RequestFromStream extends StatelessWidget {
  const RequestFromStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModelSearch>();
    return Column(
      children: [
        Text(
          viewModel.model.textFromStream,
          style: const TextStyle(
            fontSize: Dimens.textTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<BlocStream, StateStream>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return Text(
                key: Key(viewModel.model.textIsSuccesful),
                state.response.list?.let((self) => self.length.toString()) ??
                    viewModel.model.textIsSuccesful,
              );
            }
            if (state.status.isFailure) {
              return Text(viewModel.model.textIsFailure);
            }
            return Text(viewModel.model.textIsLoading);
          },
        ),
      ],
    );
  }
}
