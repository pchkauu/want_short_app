import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage(name: 'Major')
class MajorScreen extends StatelessWidget {
  const MajorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MajorScreenContent();
  }
}

class MajorScreenContent extends StatefulWidget {
  const MajorScreenContent({
    super.key,
  });

  @override
  State<MajorScreenContent> createState() => _MajorScreenContentState();
}

class _MajorScreenContentState extends State<MajorScreenContent> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
