import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:short/src/core/_barrel.dart';
import 'package:short/src/feature/shared/presentation/splash/_barrel.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  List<NavigatorObserver> Function() get navigationObservers {
    return () {
      return [
        TalkerRouteObserver(
          Log.talker,
        ),
      ];
    };
  }

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/',
          page: Splash.page,
          initial: true,
          durationInMilliseconds: 350,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
