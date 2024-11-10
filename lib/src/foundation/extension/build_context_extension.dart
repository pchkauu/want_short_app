import 'package:flutter/material.dart';

extension OrientationExtension on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
}

extension MediaQueryValuesExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension SizeConfigExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  double heightPercentage(double percentage) => screenHeight * percentage / 100;
  double widthPercentage(double percentage) => screenWidth * percentage / 100;
}

extension ResponsiveExtension on BuildContext {
  bool get isMobileScreenWidth => screenWidth < 600;
  bool get isTabletScreenWidth => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktopScreenWidth => screenWidth >= 1200;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get topPadding => padding.top;
  double get bottomPadding => padding.bottom;
  double get leftPadding => padding.left;
  double get rightPadding => padding.right;
}

extension SimpleThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ColorSchemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension ScaffoldExtension on BuildContext {
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

extension FormExtension on BuildContext {
  void saveForm() {
    Form.of(this).save();
  }

  bool validateForm() {
    return Form.of(this).validate();
  }
}

extension FocusScopeExtension on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}

extension SafeAreaExtension on BuildContext {
  bool get hasSafeArea {
    final padding = MediaQuery.of(this).padding;

    return padding.top > 0 || padding.bottom > 0 || padding.left > 0 || padding.right > 0;
  }
}

extension KeyboardVisibilityExtension on BuildContext {
  bool get isKeyboardOpen {
    return MediaQuery.of(this).viewInsets.bottom != 0;
  }
}

extension VisibilityExtension on BuildContext {
  bool get isVisible {
    final renderObject = findRenderObject();
    return renderObject != null && renderObject.attached;
  }
}
