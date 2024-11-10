import 'package:short/src/core/_barrel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links3/uni_links.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitialState()) {
    on<SplashInitialEvent>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 2));

        try {
          final initialUri = await getInitialUri();
          Log.d('Initial Uri: $initialUri');

          if (initialUri != null) {
            emit(const SplashMajorState());
            return;
          }
        } on Object catch (e) {
          Log.d(
            'Error: $e',
          );
        }

        emit(const SplashFacadeState());
      },
    );
  }
}

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

final class SplashInitialEvent extends SplashEvent {
  const SplashInitialEvent();
}

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

final class SplashInitialState extends SplashState {
  const SplashInitialState();
}

final class SplashFacadeState extends SplashState {
  const SplashFacadeState();
}

final class SplashMajorState extends SplashState {
  const SplashMajorState();
}
