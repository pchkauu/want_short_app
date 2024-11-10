import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short/src/core/_barrel.dart';
import 'package:short/src/feature/shared/presentation/splash/_barrel.dart';

@RoutePage(name: 'Splash')
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {},
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
      backgroundColor: ColorName.blue,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorName.blue.shade700,
              ColorName.blue.shade600,
              ColorName.blue.shade500,
              ColorName.blue,
              ColorName.blue.shade400,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Want Short',
                  style: TextStyle(
                    fontSize: 82,
                    color: Colors.white.withOpacity(.9),
                    fontWeight: FontWeight.w100,
                    shadows: [
                      Shadow(
                        color: ColorName.black.withOpacity(.15),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 680,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(48),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.black.withOpacity(.25),
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: TextFormField(
                          cursorOpacityAnimates: true,
                          cursorColor: ColorName.blue.shade300,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              maxHeight: 64,
                              maxWidth: 584,
                            ),
                            hintFadeDuration: const Duration(milliseconds: 200),
                            hintText: 'https://paste_url.4shrt',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: ColorName.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          style: TextStyle(
                            color: ColorName.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(256)),
                        clipBehavior: Clip.antiAlias,
                        color: ColorName.white,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(256)),
                          onTap: () {},
                          highlightColor: ColorName.blue.shade100,
                          splashFactory:
                              InkSparkle.constantTurbulenceSeedSplashFactory,
                          child: SizedBox.square(
                            dimension: 64,
                            child: Icon(
                              Icons.arrow_forward,
                              color: ColorName.blue,
                              size: 32,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
