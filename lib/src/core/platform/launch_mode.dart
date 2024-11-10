class LaunchMode {
  late final AppState _state;

  bool _isInit = false;
  static final LaunchMode _instance = LaunchMode._internal();

  LaunchMode._internal();

  factory LaunchMode() {
    return _instance;
  }
  bool get isInit => _isInit;

  static LaunchMode get instance => _instance;

  Future<LaunchMode> setAppState(AppState state) async {
    if (_isInit) return _instance;

    _state = state;

    _isInit = true;

    return _instance;
  }

  bool get isForeground => _state == AppState.foreground;

  bool get notForeground => _state != AppState.foreground;

  bool get isBackground => _state == AppState.background;

  bool get isIsolate => _state == AppState.isolate;

  String get name => _state.name.toUpperCase();
}

enum AppState {
  foreground,
  background,
  isolate,
}
