import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short/src/feature/shared/presentation/splash/_barrel.dart';
import 'package:short/src/feature/shared/presentation/system/controller/router/app_router.dart';
import 'package:short/src/foundation/_barrel.dart';

@RoutePage(name: 'Splash')
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(const SplashInitialEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is SplashMajorState) {
            await context.router.replace(const Major());
            return;
          }
        },
        child: const SplashScreenContent(),
      ),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const CupertinoActivityIndicator(radius: 24),
            const SizedBox(height: 24),
            SizedBox(
              height: 32,
              child: Text(
                'Want Short',
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
